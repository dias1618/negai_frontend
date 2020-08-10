import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/cadastro_midia_controller.dart';

class TituloComponent extends StatefulWidget {

  const TituloComponent({Key key,}) : super(key: key);  

  @override
  _TituloComponentState createState() => _TituloComponentState();
}

class _TituloComponentState extends State<TituloComponent> {

  CadastroMidiaController cadastroMidiaController = Modular.get<CadastroMidiaController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        controller: cadastroMidiaController.tituloController,
        autofocus: false,
        decoration: new InputDecoration(
          labelText: "Título",
          
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Digite um Título';
          }
          return null;
        },
        keyboardType: TextInputType.text,
      )
    );
  }
}