import 'package:aquila_frontend_main/app/shared/components/custom_app_bar_widget.dart';
import 'package:aquila_frontend_main/app/shared/components/nav_drawer_widget.dart';
import 'package:aquila_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: CustomAppBar(
        title: widget.title,
        leading: false,
      ),
      body: Column(
        children: <Widget>[
          Text(this.usuarioStore.usuario.nome)
        ],
      ),
    );
  }
}
