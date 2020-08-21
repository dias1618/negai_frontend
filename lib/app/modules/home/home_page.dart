import 'package:negai_frontend_main/app/models/grupo-midia.model.dart';
import 'package:negai_frontend_main/app/viewmodels/grupo-midia.viewmodel.dart';
import 'package:negai_frontend_main/app/viewmodels/item-panel.viewmodel.dart';
import 'package:negai_frontend_main/app/modules/home/components/card_midia_component.dart';
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
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      grupoMidia.titulo, 
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  )
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        (grupoMidia.midias != null ? '${grupoMidia.midias.length} cadastrado(s)' : "Nenhum cadastrado"), 
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: 13.0
                                        ),
                                      )
                                    )
                                  )
                                ),
                              ],
                            )
                            
                            
                          )
                        );
                      },
                      isExpanded: grupoMidia.expandido,
                      body: Visibility(
                        visible: grupoMidia.midias != null && grupoMidia.midias.length > 0,
                        child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: (grupoMidia.midias != null ? grupoMidia.midias.length : 0),
                                itemBuilder: (context, index){
                                  return CardMidiaComponent(
                                    midia: grupoMidia.midias[index],
                                    onTap: homeController.gerenciarMidia
                                  );
                                }
                              )
                            ],
                          )
                        )
                      )
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
