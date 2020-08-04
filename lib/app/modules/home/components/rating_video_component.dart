import 'package:aquila_frontend_main/app/modules/home/home_controller.dart';
import 'package:aquila_frontend_main/app/shared/components/star_rating_widget.dart';
import 'package:aquila_frontend_main/app/stores/video.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RatingVideoComponent extends StatefulWidget {
  @override
  _RatingVideoComponentState createState() => _RatingVideoComponentState();
}

class _RatingVideoComponentState extends State<RatingVideoComponent> {

  VideoStore videoStore = Modular.get<VideoStore>();
  HomeController homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Row(
        children: <Widget>[
          StarRating(
            onChanged: (newValue){
              homeController.notaVideo = newValue;
            },
            value: homeController.notaVideo,
          ),
          Spacer(),
          Text(
            (videoStore.videos.length > 0 ? videoStore.videoAtual.categoria.nome : ""),
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          )
        ],
      )
    );
  }
}