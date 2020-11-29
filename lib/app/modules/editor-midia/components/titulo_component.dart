import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/modules/editor-midia/editor_midia_controller.dart';

class TituloComponent extends StatefulWidget {
  @override
  _TituloComponentState createState() => _TituloComponentState();
}

class _TituloComponentState extends State<TituloComponent> {

  EditorMidiaController editorMidiaController = Modular.get<EditorMidiaController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            editorMidiaController.titulo,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            editorMidiaController.grupoMidia,
            style: TextStyle(
              fontSize: 16.0,
            ),
          )
        ],
      )
    );
  }
}