import 'package:flutter/material.dart';

class TituloComponent extends StatefulWidget {
  @override
  _TituloComponentState createState() => _TituloComponentState();
}

class _TituloComponentState extends State<TituloComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'One Piece',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'Anime',
            style: TextStyle(
              fontSize: 16.0,
            ),
          )
        ],
      )
    );
  }
}