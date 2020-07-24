import 'package:aquila_frontend_main/app/models/video.model.dart';
import 'package:mobx/mobx.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'video.store.g.dart';

class VideoStore = _VideoStoreBase with _$VideoStore;

abstract class _VideoStoreBase with Store{

  @observable
  VideoModel videoAtual;

  @observable
  ObservableList<VideoModel> videos = ObservableList.of([]);

  @observable
  YoutubePlayerController youtubePlayerController = new YoutubePlayerController(
    initialVideoId: '7Mxg4VkkRRI', 
    flags: YoutubePlayerFlags(
        controlsVisibleAtStart: true,
    )
  );
  
}