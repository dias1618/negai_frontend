import 'package:aquila_frontend_main/app/models/video.model.dart';
import 'package:aquila_frontend_main/app/modules/home/pages/saiba_mais_page.dart';
import 'package:aquila_frontend_main/app/services/loading-manager/loading_manager_service.dart';
import 'package:aquila_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:aquila_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:aquila_frontend_main/app/stores/video.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:aquila_frontend_main/app/repositories/video.repository.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  VideoRepository videoRespository = Modular.get<VideoRepository>();
  VideoStore videoStore = Modular.get<VideoStore>();
  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();
  
  @action
  Future initVideos() async {
    RepositoryDto repositoryDto = await videoRespository.getVideos();
    if (repositoryDto.statusCode == RepositoryManager.STATUS_OK) {
      List videosData = repositoryDto.data;
      videosData.forEach((videoData) {
        videoStore.videos.add(VideoModel.fromJson(videoData));
      });

      videoStore.videoAtual = videoStore.videos.first;

      videoStore.youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoStore.videoAtual.idPlatform,
        flags: YoutubePlayerFlags(
          controlsVisibleAtStart: true,
        )
      );

    } 
    else {
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }
  }

  @action
  Future<void> openSaibaMais(context) async{
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SaibaMaisPage();
        }
      );

  }

}
