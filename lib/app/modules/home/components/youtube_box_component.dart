import 'package:aquila_frontend_main/app/stores/video.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeBoxComponent extends StatefulWidget {
  
  final YoutubePlayer youtubePlayer;

  YoutubeBoxComponent({this.youtubePlayer});

  @override
  _YoutubeBoxComponentState createState() => _YoutubeBoxComponentState();
}

class _YoutubeBoxComponentState extends State<YoutubeBoxComponent> {

  VideoStore videoStore = Modular.get<VideoStore>();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 5.0
        ),
      ),
      child: Observer(
        builder: (_) => Visibility(
          visible: videoStore.videos.length > 0,
          child: widget.youtubePlayer 
        )
      ),
    );
  }
  
  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    videoStore.youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    videoStore.youtubePlayerController.dispose();
    super.dispose();
  }

}