import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:negai_frontend_main/app/models/grupo-midia.model.dart';
import 'package:negai_frontend_main/app/models/grupo-midia.viewmodel.dart';
import 'package:negai_frontend_main/app/models/midia.model.dart';
import 'package:negai_frontend_main/app/models/situacao-midia.model.dart';
import 'package:negai_frontend_main/app/models/situacao-acompanhamento.model.dart';
import 'package:flutter/material.dart';
import 'package:negai_frontend_main/app/repositories/midia.repository.dart';
import 'package:negai_frontend_main/app/services/loading-manager/loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:negai_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:negai_frontend_main/app/stores/grupo_midia_store.dart';

part 'cadastro_midia_controller.g.dart';

class CadastroMidiaController = _CadastroMidiaControllerBase
    with _$CadastroMidiaController;

abstract class _CadastroMidiaControllerBase with Store {
  
  @observable
  GrupoMidiaViewModel grupoMidiaValue;
  @observable
  SituacaoMidia situacaoMidiaValue;
  @observable
  SituacaoAcompanhamento situacaoAcompanhamentoValue;
  @observable
  PickedFile imageFile;
  @observable
  TextEditingController tituloController = new TextEditingController();
  @observable
  TextEditingController ultimoVistoController = new TextEditingController();

  GrupoMidiaStore grupoMidiaStore = Modular.get<GrupoMidiaStore>();  
  MidiaRepository midiaRespository = Modular.get<MidiaRepository>();
  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();


  Future<void> salvarMidia() async{
    
    progressDialogService.showLoading('Salvando mídia...');
    Midia midia = Midia(
      titulo: tituloController.value.text,
      situacaoMidia: situacaoMidiaValue.value,
      situacaoAcompanhamento: situacaoAcompanhamentoValue.value,
      ultimoVisto: int.parse(ultimoVistoController.value.text),
      grupoMidia: GrupoMidia.fromJson(grupoMidiaValue.toJson()) 
    );
    RepositoryDto repositoryDto = await midiaRespository.saveMidia(midia);
    if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
      midia = Midia.fromJson(repositoryDto.data);
      grupoMidiaValue.addMidia(midia);
      Modular.to.popUntil(ModalRoute.withName('/home'));
    }
    else{
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }

  }
}
