import 'package:flutter/material.dart';
import 'package:negai_frontend_main/app/models/grupo-midia.model.dart';
import 'package:negai_frontend_main/app/viewmodels/grupo-midia.viewmodel.dart';
import 'package:negai_frontend_main/app/models/midia.model.dart';
import 'package:negai_frontend_main/app/repositories/midia.repository.dart';
import 'package:negai_frontend_main/app/services/loading-manager/loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:negai_frontend_main/app/stores/grupo_midia_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();
  MidiaRepository midiaRepository = Modular.get<MidiaRepository>();
  GrupoMidiaStore grupoMidiaStore = Modular.get<GrupoMidiaStore>();

  init() async{
    grupoMidiaStore.gruposMidia = ObservableList.of([]);
    progressDialogService.showLoading('Carregando...');
    RepositoryDto repositoryDto = await midiaRepository.getGruposMidia();
    if (repositoryDto.statusCode == RepositoryManager.STATUS_OK) {
      for(var element in repositoryDto.data) {
        GrupoMidiaViewModel grupoMidiaViewModel = GrupoMidiaViewModel.fromJson(element);
        await this.adicionarMidias(grupoMidiaViewModel);
      }
    } else {
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }
  }

  adicionarMidias(GrupoMidiaViewModel grupoMidiaViewModel) async{
    RepositoryDto repositoryDto = await midiaRepository.getMidia(grupoMidiaViewModel.id);
    if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
      for(var element in repositoryDto.data){
        grupoMidiaViewModel.addMidia(Midia.fromJson(element));
      }
    } else {
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }
    grupoMidiaViewModel.expandido = false;
    grupoMidiaStore.gruposMidia.add(grupoMidiaViewModel);
  }

  cadastrarMidia(){
    Modular.to.pushNamed('/midia/novo');
  }

  gerenciarMidia(Midia midia){
    Modular.to.pushNamed('/midia/editor', arguments: {'midia': midia});
  }

}
