import 'package:aquila_frontend_main/app/repositories/video.repository.dart';
import 'package:aquila_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController()),
    Bind((i) => DioRepositoryManager()),
    Bind((i) => VideoRepository()),
    Bind((i) => ProgressLoadingManagerService()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => HomePage()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}
