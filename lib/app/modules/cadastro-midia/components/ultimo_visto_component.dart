import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/cadastro_midia_controller.dart';

class UltimoVistoComponent extends StatefulWidget {
  @override
  _UltimoVistoComponentState createState() => _UltimoVistoComponentState();
}

class _UltimoVistoComponentState extends State<UltimoVistoComponent> {
  CadastroMidiaController cadastroMidiaController = Modular.get<CadastroMidiaController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        controller: cadastroMidiaController.cadastroMidiaViewModel.ultimoVistoController,
        autofocus: false,
        decoration: new InputDecoration(
          labelText: "Último visto",
          
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Digite o último visto';
          }
          return null;
        },
        keyboardType: TextInputType.number,
      )
    );
  }
}