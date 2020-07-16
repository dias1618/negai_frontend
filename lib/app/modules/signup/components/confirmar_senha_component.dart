import 'package:aquila_frontend_main/app/shared/validators/confirmacao_diferente_validator.dart';
import 'package:aquila_frontend_main/app/shared/validators/empty_validator.dart';
import 'package:aquila_frontend_main/app/shared/validators/field_validator.dart';
import 'package:flutter/material.dart';

class ConfirmarSenhaComponent extends StatefulWidget {

  final TextEditingController senhaController;
  final TextEditingController confirmarSenhaController;

  const ConfirmarSenhaComponent({Key key, this.confirmarSenhaController, this.senhaController}) : super(key: key);  

  @override
  _ConfirmarSenhaComponentState createState() => _ConfirmarSenhaComponentState();
}

class _ConfirmarSenhaComponentState extends State<ConfirmarSenhaComponent> {
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      obscureText: true,
      controller: widget.confirmarSenhaController,
      decoration: new InputDecoration(
        labelText: "Confirmar senha",
        
      ),
      validator: (value) {
        return FieldValidator(
          value: value, 
          validators: [
            EmptyValidator(
              errorMessage: 'Digite uma confirmação de senha'
            ),
            ConfirmacaoDiferenteValidator(
              campoSenha: widget.senhaController,
              errorMessage: 'As senhas são diferentes'
            )
          ]
        ).validate();
      },
      keyboardType: TextInputType.text,
    );
  }
}