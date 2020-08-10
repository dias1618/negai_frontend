import 'package:negai_frontend_main/app/models/grupo-midia.model.dart';
import 'package:negai_frontend_main/app/models/grupo-midia.viewmodel.dart';
import 'package:negai_frontend_main/app/models/item-panel.viewmodel.dart';
import 'package:negai_frontend_main/app/shared/components/custom_app_bar_widget.dart';
import 'package:negai_frontend_main/app/shared/components/nav-drawer/nav_drawer_widget.dart';
import 'package:negai_frontend_main/app/stores/grupo_midia_store.dart';
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
  GrupoMidiaStore grupoMidiaStore = Modular.get<GrupoMidiaStore>();
  
  @override
  void initState() {
    super.initState();

    homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: grupoMidiaStore.gruposMidia.length > 0,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          drawer: NavDrawer(),
          drawerScrimColor: Colors.black54,
          appBar: CustomAppBar(
            title: widget.title,
            leading: true,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.add,
              color: Theme.of(context).accentColor,
            ),
            onPressed: homeController.cadastrarMidia
          ),
          body: ListView(
            shrinkWrap: true, 
            children: [
              Padding(
                padding:  EdgeInsets.zero,
                child:  ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      grupoMidiaStore.gruposMidia[index].expandido = !grupoMidiaStore.gruposMidia[index].expandido;
                    });
                  },
                  children: grupoMidiaStore.gruposMidia.map((GrupoMidiaViewModel grupoMidia) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                grupoMidia.titulo, 
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            )
                          )
                        );
                      },
                      isExpanded: grupoMidia.expandido,
                      body: Text('Hello'),
                    );
                  }).toList(),
                ),
              ),
            ],
          )
        ) 
      )
    );
  }

}
