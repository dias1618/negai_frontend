import 'package:flutter/material.dart';

class InternalDescriptionComponent extends StatefulWidget {

  final String name;
  final String text;

  InternalDescriptionComponent({this.name, this.text});

  @override
  _InternalDescriptionComponentState createState() => _InternalDescriptionComponentState();
}

class _InternalDescriptionComponentState extends State<InternalDescriptionComponent> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
        style: new TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: '${widget.name}: ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: widget.text)
        ]),
      ),
    );
  }
}