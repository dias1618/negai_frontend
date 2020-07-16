import 'package:aquila_frontend_main/app/shared/validators/validator.dart';
import 'package:flutter/material.dart';

class ConfirmacaoDiferenteValidator implements Validator{

  TextEditingController campoSenha;

  @override
  String errorMessage;

  ConfirmacaoDiferenteValidator({this.campoSenha, this.errorMessage});

  
  @override
  bool validate(value) {
    if(value.toString().isEmpty || campoSenha.value.text.isEmpty || !value.toString().endsWith(campoSenha.value.text.toString()))
      return false;
    return true;
  }
  
}