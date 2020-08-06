import 'package:negai_frontend_main/app/modules/login/components/cadastrar_component.dart';
import 'package:negai_frontend_main/app/modules/login/components/enter_component.dart';
import 'package:negai_frontend_main/app/modules/login/components/id_component.dart';
import 'package:negai_frontend_main/app/modules/login/components/logo_component.dart';
import 'package:negai_frontend_main/app/modules/login/components/senha_component.dart';
import 'package:negai_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _formKey = Modular.get<GlobalKey<FormState>>();
  final loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    ProgressLoadingManagerService.initProgressDialog(context);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: ListView(
        shrinkWrap: true, 
        reverse: false, 
        children: <Widget>[
          Column(
            children: <Widget>[
              new SizedBox(
                height: 60.0,
              ),
              LogoComponent(),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IdComponent(
                        idController: loginController.idController(),
                      ),
                      SenhaComponent(
                        senhaController: loginController.senhaController(),
                      ),
                      EnterComponent(
                        onPressed: loginController.login,
                      ),
                      CadastrarComponent(
                        onPressed: loginController.signup)
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
