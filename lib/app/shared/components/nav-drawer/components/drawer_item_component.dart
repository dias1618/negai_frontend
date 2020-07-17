import 'package:flutter/material.dart';

class DrawerItemComponent extends StatefulWidget {

  final IconData iconData;
  final String title;
  final Function onTap;

  DrawerItemComponent({this.iconData, this.onTap, this.title});

  @override
  _DrawerItemComponentState createState() => _DrawerItemComponentState();
}

class _DrawerItemComponentState extends State<DrawerItemComponent> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.iconData),
      title: Text(widget.title),
      onTap: () => {
        widget.onTap()
      },
    );
  }
}