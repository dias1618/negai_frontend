import 'package:negai_frontend_main/app/shared/validators/empty_validator.dart';
import 'package:negai_frontend_main/app/shared/validators/field_validator.dart';
import 'package:flutter/material.dart';

class IdComponent extends StatefulWidget {

  final TextEditingController idController;

  const IdComponent({Key key, this.idController}) : super(key: key);  

  @override
  _IdComponentState createState() => _IdComponentState();
}

class _IdComponentState extends State<IdComponent> {
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: widget.idController,
      autofocus: false,
      decoration: new InputDecoration(
        labelText: "ID",
        
      ),
      validator: (value) {
        return FieldValidator(
          value: value, 
          validators: [
            EmptyValidator(
              errorMessage: 'Digite um ID'
            )
          ]
        ).validate();
      },
      keyboardType: TextInputType.text,
    );
  }
}