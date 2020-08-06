import 'package:negai_frontend_main/app/shared/validators/empty_validator.dart';
import 'package:negai_frontend_main/app/shared/validators/field_validator.dart';
import 'package:flutter/material.dart';

class SenhaComponent extends StatefulWidget {

  final TextEditingController senhaController;

  const SenhaComponent({Key key, this.senhaController}) : super(key: key);  

  @override
  _SenhaComponentState createState() => _SenhaComponentState();
}

class _SenhaComponentState extends State<SenhaComponent> {
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      obscureText: true,
      controller: widget.senhaController,
      autofocus: false,
      decoration: new InputDecoration(
        labelText: "Senha",
        
      ),
      validator: (value) {
        return FieldValidator(
          value: value, 
          validators: [
            EmptyValidator(
              errorMessage: 'Digite uma senha'
            )
          ]
        ).validate();
      },
      keyboardType: TextInputType.text,
    );
  }
}