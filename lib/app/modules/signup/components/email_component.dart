import 'package:negai_frontend_main/app/shared/validators/email_validator.dart';
import 'package:negai_frontend_main/app/shared/validators/empty_validator.dart';
import 'package:negai_frontend_main/app/shared/validators/field_validator.dart';
import 'package:flutter/material.dart';

class EmailComponent extends StatefulWidget {

  final TextEditingController emailController;

  const EmailComponent({Key key, this.emailController}) : super(key: key);  

  @override
  _EmailComponentState createState() => _EmailComponentState();
}

class _EmailComponentState extends State<EmailComponent> {
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: widget.emailController,
      autofocus: false,
      decoration: new InputDecoration(
        labelText: "Email",
        
      ),
      validator: (value) {
        return FieldValidator(
          value: value, 
          validators: [
            EmptyValidator(
              errorMessage: 'Digite um email'
            ),
            EmailValidator(
              errorMessage: 'Email inválido'
            )
          ]
        ).validate();
      },
      keyboardType: TextInputType.text,
    );
  }
}