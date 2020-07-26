import 'package:aquila_frontend_main/app/repositories/categoria.repository.dart';
import 'package:aquila_frontend_main/app/repositories/usuario.repository.dart';
import 'package:aquila_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:aquila_frontend_main/app/services/message-manager/toasty_message_manager_service.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';

import 'signup_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'signup_page.dart';

class SignupModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => SignupController()),
    Bind((i) => DioRepositoryManager()),
    Bind((i) => UsuarioRespository()),
    Bind((i) => CategoriaRepository()),
    Bind((i) => ProgressLoadingManagerService()),
    Bind((i) => ToastyMessageManagerService()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => SignupPage()),
  ];

  static Inject get to => Inject<SignupModule>.of();
}
