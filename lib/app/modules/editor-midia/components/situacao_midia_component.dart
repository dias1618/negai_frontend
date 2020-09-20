import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/modules/editor-midia/components/item_situacao_midia_component.dart';
import 'package:negai_frontend_main/app/repositories/situacao_midia.repository.dart';

class SituacaoMidiaComponent extends StatefulWidget {
  @override
  _SituacaoMidiaComponentState createState() => _SituacaoMidiaComponentState();
}

class _SituacaoMidiaComponentState extends State<SituacaoMidiaComponent> {

  SituacaoMidiaRepository situacaoMidiaRepository = Modular.get<SituacaoMidiaRepository>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: situacaoMidiaRepository.situacoes.length,
        children: List.generate(situacaoMidiaRepository.situacoes.length, (index) {
            return ItemSituacaoMidiaComponent(
              index: index,
            );
          }
        )
      ),
    );
  }
}