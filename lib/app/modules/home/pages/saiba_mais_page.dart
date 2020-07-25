import 'package:aquila_frontend_main/app/stores/video.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SaibaMaisPage extends StatefulWidget {
  @override
  _SaibaMaisPageState createState() => _SaibaMaisPageState();
}

class _SaibaMaisPageState extends State<SaibaMaisPage> {

  VideoStore videoStore = Modular.get<VideoStore>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.all(0),
      titlePadding: EdgeInsets.all(0.0),
      insetPadding: EdgeInsets.all(15.0),
      title: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.topCenter,
        color: Theme.of(context).primaryColor,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 10.0), 
            child: Text(
              "Descrição do vídeo",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor
              ),
            ),
          )
        ),
      ),
      content: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Título: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: videoStore.videoAtual.titulo)
                  ]),
                )
              )
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
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
                    TextSpan(text: videoStore.videoAtual.canal.titulo)
                  ]),
                )
              )
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
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
                )
              )
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'Descrição: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: videoStore.videoAtual.descricao)
                  ]),
                )
              )
            ),      
          ],
        ),
      
    );
  }
}