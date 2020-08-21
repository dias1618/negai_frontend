import 'package:negai_frontend_main/app/viewmodels/signup-tab.viewmodel.dart';
import 'package:negai_frontend_main/app/models/usuario.model.dart';
import 'package:negai_frontend_main/app/repositories/usuario.repository.dart';
import 'package:negai_frontend_main/app/services/loading-manager/loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:negai_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {

  @observable
  TabController _tabController;
  TabController get tabController{
    return _tabController;
  }
  set tabController(_tabController){
    this._tabController = _tabController;
  }

  @observable
  ObservableList<SignupTabViewModel> listTabViewModel;

  final formKey = GlobalKey<FormState>();
  
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
  TextEditingController _emailController = new TextEditingController();
  @action
  TextEditingController emailController(){
    return _emailController;
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

  void init() async{
    listTabViewModel = ObservableList.of([
      SignupTabViewModel(
        onTapBack: (){Modular.to.pop();}, 
        onTapForward: createUsuario, 
        titulo: 'Dados básicos'),
    ]);
    
  }

  void createUsuario() async{
    if(!formKey.currentState.validate()){
      return;
    }  

    progressDialogService.showLoading('Criando usuário...');

    Usuario usuario = Usuario(
      nome: nomeController().value.text,
      login: idController().value.text,
      senha: senhaController().value.text,
      email: emailController().value.text
    );

    RepositoryDto repositoryDto = await usuarioRespository.createUsuario(usuario);
    
    if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
      usuarioStore.usuario = Usuario.fromJson(repositoryDto.data);
      Modular.to.pushReplacementNamed('/home');
    }
    else{
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }

  }

}
