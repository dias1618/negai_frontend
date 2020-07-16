import 'package:aquila_frontend_main/app/models/usuario.model.dart';
import 'package:aquila_frontend_main/app/repositories/usuario.repository.dart';
import 'package:aquila_frontend_main/app/services/loading-manager/loading_manager_service.dart';
import 'package:aquila_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:aquila_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:aquila_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {

  @observable
  TextEditingController _nomeController = new TextEditingController();
  @action
  TextEditingController nomeController(){
    return _nomeController;
  }

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

  @observable
  TextEditingController _confirmarSenhaController = new TextEditingController();
  @action
  TextEditingController confirmarSenhaController(){
    return _confirmarSenhaController;
  }


  UsuarioStore usuarioStore = Modular.get<UsuarioStore>();
  UsuarioRespository usuarioRespository = Modular.get<UsuarioRespository>();
  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();

  void createUsuario(BuildContext context) async{
    progressDialogService.showLoading('Criando usuário...');

    RepositoryDto repositoryDto = await usuarioRespository.createUsuario(
      UsuarioModel(
        nome: nomeController().value.text,
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
