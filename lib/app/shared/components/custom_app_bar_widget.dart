import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 60;
  final String title;
  final bool leading;
  final Function onPressed;
  final PreferredSizeWidget bottom;

  const CustomAppBar(
      {Key key, this.title, this.leading = true, this.onPressed, this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Theme.of(context).accentColor
      ),
      automaticallyImplyLeading: this.leading,
      backgroundColor: Theme.of(context).primaryColor,
      title: Padding(
        padding: EdgeInsets.only(
          left: (this.leading ? 0 : 10)
        ),
        child: Text(
          (title != null ? title : "negai"),
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: (title.length > 10 ? 16.0 : 18.0)
          ),
        ),
      ),
      bottom: bottom,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.power_settings_new,
          ),
          onPressed: () {
            Modular.to.popUntil(ModalRoute.withName('/'));
          }
        )
      ]
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
