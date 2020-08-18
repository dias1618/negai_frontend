import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:negai_frontend_main/app/repositories/situacao_acompanhamento.repository.dart';
import 'package:negai_frontend_main/app/repositories/situacao_midia.repository.dart';
import 'package:negai_frontend_main/app/stores/grupo_midia_store.dart';

import 'cadastro_midia_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_midia_page.dart';

class CadastroMidiaModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => CadastroMidiaController()),
    Bind((i) => SituacaoMidiaRepository()),
    Bind((i) => SituacaoAcompanhamentoRepository()),
    Bind((i) => LabeledGlobalKey<FormState>('1')),
    Bind((i) => GrupoMidiaStore)
  ];

  @override
  List<Router> get routers => [Router(Modular.initialRoute, child: (_, args) => CadastroMidiaPage()),];

  static Inject get to => Inject<CadastroMidiaModule>.of();

}
  