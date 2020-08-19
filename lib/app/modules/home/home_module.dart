import 'package:negai_frontend_main/app/repositories/midia.repository.dart';
import 'package:negai_frontend_main/app/repositories/situacao_acompanhamento.repository.dart';
import 'package:negai_frontend_main/app/repositories/situacao_midia.repository.dart';
import 'package:negai_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:negai_frontend_main/app/stores/grupo_midia_store.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController()),
    Bind((i) => DioRepositoryManager()),
    Bind((i) => ProgressLoadingManagerService()),
    Bind((i) => MidiaRepository()),
    Bind((i) => GrupoMidiaStore()),
    Bind((i) => SituacaoAcompanhamentoRepository()),
    Bind((i) => SituacaoMidiaRepository()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => HomePage()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}
