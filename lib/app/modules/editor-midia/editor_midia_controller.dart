import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:negai_frontend_main/app/models/grupo-midia.model.dart';
import 'package:negai_frontend_main/app/viewmodels/cadastro-midia.viewmodel.dart';
import 'package:negai_frontend_main/app/models/midia.model.dart';
import 'package:flutter/material.dart';
import 'package:negai_frontend_main/app/repositories/midia.repository.dart';
import 'package:negai_frontend_main/app/services/loading-manager/loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:negai_frontend_main/app/stores/grupo_midia_store.dart';

part 'editor_midia_controller.g.dart';

class EditorMidiaController = _EditorMidiaControllerBase
    with _$EditorMidiaController;

abstract class _EditorMidiaControllerBase with Store {

  int id;
  String titulo;
  String grupoMidia;
  @observable
  int situacaoMidia;
  

  GrupoMidiaStore grupoMidiaStore = Modular.get<GrupoMidiaStore>();  
  MidiaRepository midiaRespository = Modular.get<MidiaRepository>();
  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();

  load(Midia midia){
    id = midia.id;
    titulo = midia.titulo;
    grupoMidia = midia.grupoMidia.titulo;
    situacaoMidia = midia.situacaoMidia;
  }

  Future<void> removerMidia() async{
    
    progressDialogService.showLoading('Removendo mídia...');
    RepositoryDto repositoryDto = await midiaRespository.removerMidia(id);
    if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
      Modular.to.popUntil(ModalRoute.withName('/home'));
    }
    else{
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }

  }
}
