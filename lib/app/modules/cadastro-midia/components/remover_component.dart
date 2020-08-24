import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/cadastro_midia_controller.dart';

class RemoverComponent extends StatefulWidget {
  @override
  _RemoverComponentState createState() => _RemoverComponentState();
}

class _RemoverComponentState extends State<RemoverComponent> {
  CadastroMidiaController cadastroMidiaController = Modular.get<CadastroMidiaController>();
  LabeledGlobalKey<FormState> globalKey = Modular.get<LabeledGlobalKey<FormState>>();
  FocusNode _focusNode = FocusNode();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 50.0,
        child: FlatButton(
          focusNode: _focusNode,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0)
          ),
          color: Theme.of(context).errorColor,
          onPressed: ()async {
            this._focusNode.requestFocus();
            await cadastroMidiaController.removerMidia();
          }, 
          child: Text(
            'Remover',
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