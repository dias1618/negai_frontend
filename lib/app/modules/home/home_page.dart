import 'package:aquila_frontend_main/app/shared/components/custom_app_bar_widget.dart';
import 'package:aquila_frontend_main/app/shared/components/nav-drawer/nav_drawer_widget.dart';
import 'package:aquila_frontend_main/app/shared/components/star_rating_widget.dart';
import 'package:aquila_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
        controlsVisibleAtStart: true,
    ),
  );


  @override
  Widget build(BuildContext context) {
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'O Último Tango em Paris',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
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
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressColors: ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                ),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0), 
            child: Row(
              children: <Widget>[
                StarRating(
                  onChanged: (newValue){
                    //cadastrarJogadorController.nivelJogador = newValue;
                  },
                  value: 5,
                ),
                Spacer(),
                Text(
                  'Drama/Ficção',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Data de Lançamento: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '20/03/2020')
                ]),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Autor: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'Disney')
                ]),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Média de estrelas: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '3,5')
                ]),
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'SaibaMais...',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue
                ),
              ),
            )
          ),
          Spacer(
            flex: 1
          ),
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 90.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://picsum.photos/200'))
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 90.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://picsum.photos/200'))
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 90.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://picsum.photos/200'))
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 90.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://picsum.photos/200'))
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 90.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage('https://picsum.photos/200'))
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Container(
              color: Theme.of(context).primaryColor,
              child: DropdownButton<String>(
                dropdownColor: Theme.of(context).primaryColor,
                isExpanded: true,
                value: 'Filmes/Series',
                icon: Icon(
                  Icons.arrow_downward,
                  color: Theme.of(context).accentColor,
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 0,
                ),
                onChanged: (String newValue) {
                  //setState(() {
                  //  dropdownValue = newValue;
                  //});
                },
                items: <String>['Filmes/Series', 'Animes', 'Bobagens', 'Curiosidades']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Theme.of(context).accentColor
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            )
          ),
        ],
      ),
    );
  }


  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
