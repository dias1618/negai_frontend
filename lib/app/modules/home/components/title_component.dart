import 'package:aquila_frontend_main/app/stores/video.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TitleComponent extends StatefulWidget {
  @override
  _TitleComponentState createState() => _TitleComponentState();
}

class _TitleComponentState extends State<TitleComponent> {

  VideoStore videoStore = Modular.get<VideoStore>();
  
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: videoStore.videos.length > 0,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            (videoStore.videos.length > 0 ? videoStore.videoAtual.titulo : ''),
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        )
      )
    );
  }
}