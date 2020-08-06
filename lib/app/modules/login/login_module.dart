import 'package:negai_frontend_main/app/repositories/usuario.repository.dart';
import 'package:negai_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:flutter/material.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginController()),
    Bind((i) => DioRepositoryManager()),
    Bind((i) => UsuarioRespository()),
    Bind((i) => ProgressLoadingManagerService()),
    Bind((i) => GlobalKey<FormState>())
  ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
