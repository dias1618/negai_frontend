import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/models/situacao-acompanhamento.model.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/cadastro_midia_controller.dart';
import 'package:negai_frontend_main/app/repositories/situacao_acompanhamento.repository.dart';

class SituacaoAcompanhamentoComponent extends StatefulWidget {
  @override
  _SituacaoAcompanhamentoComponentState createState() => _SituacaoAcompanhamentoComponentState();
}

class _SituacaoAcompanhamentoComponentState extends State<SituacaoAcompanhamentoComponent> {

  CadastroMidiaController cadastroMidiaController = Modular.get<CadastroMidiaController>();
  SituacaoAcompanhamentoRepository situacaoAcompanhamentoRepository = Modular.get<SituacaoAcompanhamentoRepository>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: DropdownButtonFormField<SituacaoAcompanhamento>(
        decoration: InputDecoration(
          labelText: 'Situação de Acompanhamento'
        ),
        isExpanded: true,
        value: cadastroMidiaController.cadastroMidiaViewModel.situacaoAcompanhamentoValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        validator: (value) {
          if (value==null) {
            return 'Selecione uma situação de acompanhamento';
          }
          return null;
        },
        onChanged: (SituacaoAcompanhamento newValue) {
          setState(() {
            cadastroMidiaController.cadastroMidiaViewModel.situacaoAcompanhamentoValue = newValue;
          });
        },
        items: situacaoAcompanhamentoRepository.situacoes
            .map<DropdownMenuItem<SituacaoAcompanhamento>>((SituacaoAcompanhamento value) {
          return DropdownMenuItem<SituacaoAcompanhamento>(
            value: value,
            child: Text(value.label),
          );
        }).toList(),
      )
      
    );
  }
}