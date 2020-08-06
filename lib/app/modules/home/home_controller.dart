import 'package:negai_frontend_main/app/services/loading-manager/loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:negai_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();
  UsuarioStore usuarioStore = Modular.get<UsuarioStore>();

}
