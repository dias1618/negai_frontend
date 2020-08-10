import 'package:mobx/mobx.dart';
import 'package:negai_frontend_main/app/models/grupo-midia.viewmodel.dart';
import 'package:negai_frontend_main/app/models/situacao-midia.model.dart';
import 'package:flutter/material.dart';

part 'cadastro_midia_controller.g.dart';

class CadastroMidiaController = _CadastroMidiaControllerBase
    with _$CadastroMidiaController;

abstract class _CadastroMidiaControllerBase with Store {
  
  @observable
  GrupoMidiaViewModel grupoMidiaValue;
  @observable
  SituacaoMidia situacaoMidiaValue;

  @observable
  TextEditingController tituloController = new TextEditingController();

  @observable
  TextEditingController iconeController = new TextEditingController();
  
  @observable
  TextEditingController ultimoVistoController = new TextEditingController();
  
}
