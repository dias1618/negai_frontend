import 'package:aquila_frontend_main/app/modules/signup/components/cadastrar_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/confirmar_senha_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/id_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/nome_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/senha_component.dart';
import 'package:aquila_frontend_main/app/shared/components/custom_app_bar_widget.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({Key key, this.title = "Cadastre-se"}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> with SingleTickerProviderStateMixin {
  final signupController = Modular.get<SignupController>();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      signupController.init();
    });
    signupController.tabController = TabController(vsync: this, length: 2);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Observer(
            builder: (_) => Visibility(
              visible: signupController.listTabViewModel != null && signupController.listTabViewModel.length > 0,
              child: Text(
                (signupController.listTabViewModel != null ? 
                signupController.listTabViewModel[signupController.tabController.index].titulo : 
                ""), 
                textAlign: TextAlign.center,
              )
            ),
          )
        ),
        leading: GestureDetector(
          onTap: (){
            setState(() {
              signupController.listTabViewModel[signupController.tabController.index].onTapBack();  
            });
          },
          child: Icon(Icons.arrow_back)
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10), 
            child: GestureDetector(
              child: Icon(Icons.arrow_forward), 
              onTap: (){
                setState(() {
                  signupController.listTabViewModel[signupController.tabController.index].onTapForward();  
                });
              },
            )
          )
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: signupController.tabController,
        children: [
          new SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 30.0, 
                    right: 30.0
                  ),
                  child: Form(
                    key: signupController.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        NomeComponent(
                          nomeController: signupController.nomeController(),
                        ),
                        IdComponent(
                          idController: signupController.idController(),
                        ),
                        SenhaComponent(
                          senhaController: signupController.senhaController(),
                        ),
                        ConfirmarSenhaComponent(
                          confirmarSenhaController: signupController.confirmarSenhaController(),
                          senhaController: signupController.senhaController(),
                        ),
                      ]
                    )
                  ),
                )
              ]
            )
          ),
          Observer(
            builder: (_) => Visibility(
              visible: signupController.categorias.length > 0,
              child: GridView.count(
                // Cria um grid com duas colunas
                crossAxisCount: 3,
                // Gera 100 Widgets que exibem o seu índice
                children: List.generate(signupController.categorias.length, (index) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            signupController.categorias.elementAt(index).checked = !signupController.categorias[index].checked;  
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: signupController.categorias[index].checked ?
                              Theme.of(context).accentColor :
                              Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(width: 2.0,),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 4.0,
                              ),
                            ]
                          ),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(
                                    signupController.categorias[index].checked ?
                                    Icons.check_box :
                                    Icons.check_box_outline_blank
                                  ),
                                )
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        signupController.categorias[index].nome, 
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                          fontSize: 12
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              )
                              
                            ],
                          ),
                        ),
                      ),
                    )
                  );
                }),
              ),
            )
          )  
        ]
      )
    );
  }
}
