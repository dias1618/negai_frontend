import 'package:negai_frontend_main/app/shared/components/custom_app_bar_widget.dart';
import 'package:negai_frontend_main/app/shared/components/nav-drawer/nav_drawer_widget.dart';
import 'package:negai_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: true,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: NavDrawer(),
          drawerScrimColor: Colors.black54,
          appBar: CustomAppBar(
            title: widget.title,
            leading: true,
          ),
          body: Column(
            children: <Widget>[
              
            ],
          )
        ) 
      )
    );
  }

}
