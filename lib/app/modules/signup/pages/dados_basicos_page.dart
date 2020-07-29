import 'package:aquila_frontend_main/app/modules/login/components/id_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/confirmar_senha_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/email_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/nome_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/components/senha_component.dart';
import 'package:aquila_frontend_main/app/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DadosBasicosPage extends StatefulWidget {
  @override
  _DadosBasicosPageState createState() => _DadosBasicosPageState();
}

class _DadosBasicosPageState extends State<DadosBasicosPage> {

  SignupController signupController = Modular.get<SignupController>();

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
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
                  EmailComponent(
                    emailController: signupController.emailController(),
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
    );
  }
}