import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/models/situacao-midia.model.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/cadastro_midia_controller.dart';
import 'package:negai_frontend_main/app/repositories/situacao_midia.repository.dart';

class SituacaoMidiaComponent extends StatefulWidget {
  @override
  _SituacaoMidiaComponentState createState() => _SituacaoMidiaComponentState();
}

class _SituacaoMidiaComponentState extends State<SituacaoMidiaComponent> {

  CadastroMidiaController cadastroMidiaController = Modular.get<CadastroMidiaController>();
  SituacaoMidiaRepository situacaoMidiaRepository = Modular.get<SituacaoMidiaRepository>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: DropdownButtonFormField<SituacaoMidia>(
        decoration: InputDecoration(
          labelText: 'Tipo de Midia'
        ),
        isExpanded: true,
        value: cadastroMidiaController.situacaoMidiaValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        onChanged: (SituacaoMidia newValue) {
          setState(() {
            cadastroMidiaController.situacaoMidiaValue = newValue;
          });
        },
        items: situacaoMidiaRepository.situacoes
            .map<DropdownMenuItem<SituacaoMidia>>((SituacaoMidia value) {
          return DropdownMenuItem<SituacaoMidia>(
            value: value,
            child: Text(value.label),
          );
        }).toList(),
      )
      
    );
  }
}