import 'package:negai_frontend_main/app/modules/cadastro-midia/cadastro_midia_module.dart';

import 'stores/grupo_midia_store.dart';
import 'package:negai_frontend_main/app/modules/home/home_module.dart';
import 'package:negai_frontend_main/app/modules/login/login_module.dart';
import 'package:negai_frontend_main/app/modules/signup/signup_module.dart';
import 'package:negai_frontend_main/app/stores/usuario.store.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:negai_frontend_main/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GrupoMidiaStore()),
        Bind((i) => AppController()),
        Bind((i) => UsuarioStore()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        Router('/signup', module: SignupModule()),
        Router('/home', module: HomeModule()),
        Router('/cadastro-midia', module: CadastroMidiaModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
