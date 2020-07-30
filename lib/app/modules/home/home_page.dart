import 'package:aquila_frontend_main/app/models/video.model.dart';
import 'package:aquila_frontend_main/app/modules/home/components/internal_description_component.dart';
import 'package:aquila_frontend_main/app/modules/home/components/more_description_component.dart';
import 'package:aquila_frontend_main/app/modules/home/components/next_videos_component.dart';
import 'package:aquila_frontend_main/app/modules/home/components/programacao_selection_component.dart';
import 'package:aquila_frontend_main/app/modules/home/components/rating_video_component.dart';
import 'package:aquila_frontend_main/app/modules/home/components/title_component.dart';
import 'package:aquila_frontend_main/app/shared/components/custom_app_bar_widget.dart';
import 'package:aquila_frontend_main/app/shared/components/nav-drawer/nav_drawer_widget.dart';
import 'package:aquila_frontend_main/app/stores/usuario.store.dart';
import 'package:aquila_frontend_main/app/stores/video.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final homeController = Modular.get<HomeController>();
  UsuarioStore usuarioStore = Modular.get<UsuarioStore>();
  VideoStore videoStore = Modular.get<VideoStore>();
  
  @override
  void initState() {
    super.initState();

    homeController.initVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: videoStore.videos.length > 0,
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: videoStore.youtubePlayerController,
            showVideoProgressIndicator: true,
            progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
            ),
          ), 
          builder: (context, player) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              drawer: NavDrawer(),
              drawerScrimColor: Colors.black54,
              appBar: CustomAppBar(
                title: widget.title,
                leading: true,
              ),
              body: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                    child: TitleComponent(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),  
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 5.0
                        ),
                      ),
                      child: player
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0), 
                    child: RatingVideoComponent()
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                    child: Observer(builder: (_) => InternalDescriptionComponent(
                      name: 'Data de Criação',
                      text: (videoStore.videos.length > 0 && videoStore.videoAtual.criado != null ? 
                        DateFormat('dd/MM/yyyy hh:mm').format(videoStore.videoAtual.criado) : 
                        'Sem informação'
                      ),
                    )) 
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0),
                    child: Observer(builder: (_) => InternalDescriptionComponent(
                      name: 'Autor',
                      text: (videoStore.videos.length > 0 ? videoStore.videoAtual.canal.titulo : ""),
                    ))
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0),
                    child: InternalDescriptionComponent(
                      name: 'Média de estrelas',
                      text: '3,5',
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0),
                    child: MoreDescription(
                      onPressed: homeController.openSaibaMais,
                    )
                  ),
                  Spacer(
                    flex: 1
                  ),
                  //NextVideosComponent(),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RawMaterialButton(
                      onPressed: homeController.passarVideo,
                      elevation: 2.0,
                      fillColor: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.forward,
                        color: Theme.of(context).accentColor,
                        size: 35.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ),
                  Spacer(
                    flex: 1
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ProgramacaoSelectionComponent()
                  ),
                ],
              )
            );
          }
        ) 
      )
    );
  }

}
