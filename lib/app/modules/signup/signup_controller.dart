import 'package:aquila_frontend_main/app/models/categoria-selecao.viewmodel.dart';
import 'package:aquila_frontend_main/app/models/categoria.model.dart';
import 'package:aquila_frontend_main/app/models/signup-tab.viewmodel.dart';
import 'package:aquila_frontend_main/app/models/usuario-categoria.model.dart';
import 'package:aquila_frontend_main/app/models/usuario.model.dart';
import 'package:aquila_frontend_main/app/repositories/categoria.repository.dart';
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

  @observable
  ObservableList<CategoriaSelecaoViewModel> categorias = ObservableList.of([]);

  UsuarioStore usuarioStore = Modular.get<UsuarioStore>();
  UsuarioRespository usuarioRespository = Modular.get<UsuarioRespository>();
  CategoriaRepository categoriaRepository = Modular.get<CategoriaRepository>();
  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();

  void init() async{
    listTabViewModel = ObservableList.of([
      SignupTabViewModel(
        onTapBack: (){Modular.to.pop();}, 
        onTapForward: (){
          if(!formKey.currentState.validate()){
            return;
          }
          tabController.animateTo(tabController.index+1);
        }, 
        titulo: 'Dados básicos'),
      SignupTabViewModel(
        onTapBack: (){tabController.animateTo(tabController.index-1);}, 
        onTapForward: createUsuario, 
        titulo: 'Seus gostos'),
    ]);
    RepositoryDto repositoryDto = await this.categoriaRepository.get();
    if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
      (repositoryDto.data as List).forEach((categoriaData) { 
        CategoriaSelecaoViewModel categoriaSelecaoViewModel = CategoriaSelecaoViewModel.fromJson(categoriaData);
        categoriaSelecaoViewModel.checked = false;
        categorias.add(categoriaSelecaoViewModel);
      });
    }
    
  }

  void createUsuario() async{
        
    progressDialogService.showLoading('Criando usuário...');

    UsuarioModel usuario = UsuarioModel(
      nome: nomeController().value.text,
      login: idController().value.text,
      senha: senhaController().value.text,
    );

    RepositoryDto repositoryDto = await usuarioRespository.createUsuario(
      usuario,
      getCategorias(usuario)
    );
    
    if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
      usuarioStore.usuario = UsuarioModel.fromJson(repositoryDto.data);
      Modular.to.pushReplacementNamed('/home');
    }
    else{
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }

  }

  List<UsuarioCategoriaModel> getCategorias(UsuarioModel usuario){
    List<UsuarioCategoriaModel> usuariosCategoriasModel = [];
    for(CategoriaSelecaoViewModel categoriaSelecaoViewModel in categorias){
      if(categoriaSelecaoViewModel.checked){
        usuariosCategoriasModel.add(UsuarioCategoriaModel(
          categoria: Categoria.fromJson(categoriaSelecaoViewModel.toJson()),
          usuario: usuario
        ));
      }
    }
    return usuariosCategoriasModel;
  }

}
