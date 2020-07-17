import 'package:aquila_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerHeaderComponent extends StatefulWidget {
  @override
  _DrawerHeaderComponentState createState() => _DrawerHeaderComponentState();
}

class _DrawerHeaderComponentState extends State<DrawerHeaderComponent> {

  UsuarioStore usuarioStore = Modular.get<UsuarioStore>();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20.0, left: 10.0),
            child: Container(
              width: 70.0,
              height: 70.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://i.imgur.com/BoN9kdC.png")
                )
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0, left: 20.0),
            child: Column(
              children: <Widget>[
                Text(
                  usuarioStore.usuario.nome,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                Text(
                  usuarioStore.usuario.nome,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                )
              ],
            )
          )
        ],
      ),      
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
    );
          
  }
}