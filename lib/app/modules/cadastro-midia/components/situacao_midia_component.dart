import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/cadastro_midia_controller.dart';

class SituacaoMidiaComponent extends StatefulWidget {
  @override
  _SituacaoMidiaComponentState createState() => _SituacaoMidiaComponentState();
}

class _SituacaoMidiaComponentState extends State<SituacaoMidiaComponent> {

  CadastroMidiaController cadastroMidiaController = Modular.get<CadastroMidiaController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: 'Tipo de Midia'
        ),
        isExpanded: true,
        value: cadastroMidiaController.grupoMidiaValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        onChanged: (GrupoMidiaViewModel newValue) {
          setState(() {
            cadastroMidiaController.grupoMidiaValue = newValue;
          });
        },
        items: grupoMidiaStore.gruposMidia
            .map<DropdownMenuItem<GrupoMidiaViewModel>>((GrupoMidiaViewModel value) {
          return DropdownMenuItem<GrupoMidiaViewModel>(
            value: value,
            child: Text(value.titulo),
          );
        }).toList(),
      )
      
    );
  }
}