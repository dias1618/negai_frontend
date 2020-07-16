import 'package:aquila_frontend_main/app/models/login.viewmodel.dart';
import 'package:aquila_frontend_main/app/models/usuario.model.dart';
import 'package:aquila_frontend_main/app/repositories/usuario.repository.dart';
import 'package:aquila_frontend_main/app/services/loading-manager/loading_manager_service.dart';
import 'package:aquila_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:aquila_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:aquila_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  @observable
  TextEditingController _idController = new TextEditingController();
  @action
  TextEditingController idController(){
    return _idController;
  }

  @observable
  TextEditingController _senhaController = new TextEditingController();
  @action
  TextEditingController senhaController(){
    return _senhaController;
  }

  UsuarioStore usuarioStore = Modular.get<UsuarioStore>();
  UsuarioRespository usuarioRespository = Modular.get<UsuarioRespository>();
  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();


  @action
  Future signup() async{
    await Modular.to.pushNamed('/signup');
  }

  @action 
  Future login() async{
    progressDialogService.showLoading('Autenticando...');

    RepositoryDto repositoryDto = await usuarioRespository.login(
      LoginViewModel(
        login: idController().value.text,
        senha: senhaController().value.text,
      )
    );
    
    if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
      usuarioStore.usuario = UsuarioModel.fromJson(repositoryDto.data);
      Modular.to.pushReplacementNamed('/home');
    }
    else{
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }
  }

  
}
