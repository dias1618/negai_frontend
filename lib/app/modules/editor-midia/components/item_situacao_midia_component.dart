import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/models/situacao-midia.model.dart';
import 'package:negai_frontend_main/app/modules/editor-midia/editor_midia_controller.dart';
import 'package:negai_frontend_main/app/repositories/midia.repository.dart';
import 'package:negai_frontend_main/app/repositories/situacao_midia.repository.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository_manager.dart';

class ItemSituacaoMidiaComponent extends StatefulWidget {

  final int index;
  ItemSituacaoMidiaComponent({this.index});

  @override
  _ItemSituacaoMidiaComponentState createState() => _ItemSituacaoMidiaComponentState();
}

class _ItemSituacaoMidiaComponentState extends State<ItemSituacaoMidiaComponent> {

  SituacaoMidiaRepository situacaoMidiaRepository = Modular.get<SituacaoMidiaRepository>();
  MidiaRepository midiaRespository = Modular.get<MidiaRepository>();
  EditorMidiaController editorMidiaController = Modular.get<EditorMidiaController>();
  SituacaoMidia situacaoMidia;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    situacaoMidia = situacaoMidiaRepository.situacoes[widget.index];
    if(editorMidiaController.situacaoMidia == situacaoMidia.value){
      editorMidiaController.situacaoMidia = situacaoMidia.value;
    }
  }

  changeSituacao() async {
    editorMidiaController.situacaoMidia = situacaoMidia.value;
    await midiaRespository.updateMidia(editorMidiaController.id, {'situacaoMidia': editorMidiaController.situacaoMidia});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              this.changeSituacao();
            });
          },
          child: Observer(
            builder: (_) => Container(
              decoration: BoxDecoration(
                color: (editorMidiaController.situacaoMidia == situacaoMidia.value ? Colors.blue[900] : Colors.white),
                border: Border.all(
                  width: 3.0,
                  color: Colors.grey[500]
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)
                ),
              ),
              height: 80,
              width: double.infinity,
              child: Center(
                child: Text(
                  situacaoMidiaRepository.situacoes[widget.index].label,
                  style: TextStyle(
                    color: (editorMidiaController.situacaoMidia == widget.index ? Colors.white : Colors.black),
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            )
          )
        )
      )
    );
  }
}