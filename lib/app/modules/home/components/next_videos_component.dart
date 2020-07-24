import 'package:aquila_frontend_main/app/stores/video.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NextVideosComponent extends StatefulWidget {
  @override
  _NextVideosComponentState createState() => _NextVideosComponentState();
}

class _NextVideosComponentState extends State<NextVideosComponent> {

  VideoStore videoStore = Modular.get<VideoStore>();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Próximos',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontStyle: FontStyle.italic
              ),
            )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            height: 70.0,
            child: Observer(builder: (_) => 
              Visibility(
                visible: videoStore.videos.length > 0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) => Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: GestureDetector(
                      onTap: (){
                        videoStore.videoAtual = videoStore.videos.elementAt(i);
                        videoStore.youtubePlayerController.load(videoStore.videoAtual.idPlatform);
                      },
                      child: Container(
                        width: 90.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 3.0
                          ),
                          image: DecorationImage(image: NetworkImage(videoStore.videos[i].urlImage))
                        ),
                      ),
                    )
                  ),
                  itemCount: videoStore.videos.length,
                )
              )
            )
          ),
        )
      ],
    );
  }
}