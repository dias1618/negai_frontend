import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoreDescription extends StatefulWidget {

  final Function onPressed;
  MoreDescription({this.onPressed});

  @override
  _MoreDescriptionState createState() => _MoreDescriptionState();
}

class _MoreDescriptionState extends State<MoreDescription> {
  final _globalKey = Modular.get<GlobalKey<FormState>>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          setState(() {
            print('chegou');
          });
        },
        child: Text(
          'SaibaMais...',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue
          ),
        ),
      )
    );
  }
}