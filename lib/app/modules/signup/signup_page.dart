import 'package:aquila_frontend_main/app/modules/signup/components/cadastrar_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/confirmar_senha_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/id_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/nome_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/senha_component.dart';
import 'package:aquila_frontend_main/app/shared/components/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({Key key, this.title = "Cadastre-se"}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  final _formKey = GlobalKey<FormState>();
  final signupController = Modular.get<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: CustomAppBar(
        title: 'NOVO USUÁRIO'
      ),
      body: ListView(
        shrinkWrap: true,
        reverse: false,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 30.0, 
                  right: 30.0
                ),
                child: Form(
                  key: _formKey,
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
                      CadastrarComponent(
                        globalKey: _formKey,
                        cadastrarUsuario: signupController.createUsuario,
                      ),
                    ]
                  )
                ),
              )
            ],
          ),
        ]
      )
    );
  }
}
