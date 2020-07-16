import 'package:aquila_frontend_main/app/shared/validators/empty_validator.dart';
import 'package:aquila_frontend_main/app/shared/validators/field_validator.dart';
import 'package:flutter/material.dart';

class NomeComponent extends StatefulWidget {

  final TextEditingController nomeController;

  const NomeComponent({Key key, this.nomeController}) : super(key: key);  

  @override
  _NomeComponentState createState() => _NomeComponentState();
}

class _NomeComponentState extends State<NomeComponent> {
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: widget.nomeController,
      autofocus: false,
      decoration: new InputDecoration(
        labelText: "Nome",
        
      ),
      validator: (value) {
        return FieldValidator(
          value: value, 
          validators: [
            EmptyValidator(
              errorMessage: 'Digite um nome'
            )
          ]
        ).validate();
      },
      keyboardType: TextInputType.text,
    );
  }
}