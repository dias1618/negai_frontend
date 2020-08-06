import 'package:negai_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:negai_frontend_main/app/services/message-manager/toasty_message_manager_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../signup_controller.dart';

class CadastrarComponent extends StatefulWidget {
  const CadastrarComponent({Key key}) : super(key: key);  
  @override
  CadastrarComponentState createState() => CadastrarComponentState();
}

class CadastrarComponentState extends State<CadastrarComponent> {
  FocusNode _focusNode = FocusNode();
  MessageManagerService messageManagerService = Modular.get<ToastyMessageManagerService>();
  SignupController signupController = Modular.get<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 20.0
      ), 
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 50.0,
        child: FlatButton(
          focusNode: this._focusNode,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0)
          ),
          color: Theme.of(context).primaryColor,
          onPressed: (){
            signupController.createUsuario();
            this._focusNode.requestFocus();
          }, 
          child: Text(
            'Cadastrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0
            ),
          )
        )
      ) 
    );
  }
}