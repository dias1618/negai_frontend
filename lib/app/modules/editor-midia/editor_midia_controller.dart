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
  
  CadastroMidiaViewModel cadastroMidiaViewModel;

  GrupoMidiaStore grupoMidiaStore = Modular.get<GrupoMidiaStore>();  
  MidiaRepository midiaRespository = Modular.get<MidiaRepository>();
  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();

  bool disabledGrupoMidia;

  load(Midia midia){
    disabledGrupoMidia = midia == null;
    cadastroMidiaViewModel = CadastroMidiaViewModel(midia: midia);
  }

  Future<void> salvarMidia() async{
    
    progressDialogService.showLoading('Salvando mídia...');
    Midia midia = Midia(
      id: cadastroMidiaViewModel.id,
      titulo: cadastroMidiaViewModel.tituloController.value.text,
      situacaoMidia: cadastroMidiaViewModel.situacaoMidiaValue.value,
      situacaoAcompanhamento: cadastroMidiaViewModel.situacaoAcompanhamentoValue.value,
      ultimoVisto: int.parse(cadastroMidiaViewModel.ultimoVistoController.value.text),
      grupoMidia: GrupoMidia.fromJson(cadastroMidiaViewModel.grupoMidiaValue.toJson()) 
    );
    RepositoryDto repositoryDto = await midiaRespository.saveMidia(midia);
    if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
      midia = Midia.fromJson(repositoryDto.data);
      if(cadastroMidiaViewModel.id == null || cadastroMidiaViewModel.id <= 0){
        cadastroMidiaViewModel.grupoMidiaValue.addMidia(midia);
      }
      else{
        cadastroMidiaViewModel.grupoMidiaValue.updateMidia(midia);
      }
      Modular.to.popUntil(ModalRoute.withName('/home'));
    }
    else{
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }

  }

  //FAZER REMOCAO DE MIDIA
  Future<void> removerMidia() async{
    
    progressDialogService.showLoading('Removendo mídia...');
    RepositoryDto repositoryDto = await midiaRespository.removerMidia(cadastroMidiaViewModel.id);
    if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
      cadastroMidiaViewModel.grupoMidiaValue.removeMidia(cadastroMidiaViewModel.id);
      Modular.to.popUntil(ModalRoute.withName('/home'));
    }
    else{
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }

  }
}
