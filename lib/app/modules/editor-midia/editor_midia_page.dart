import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/models/midia.model.dart';
import 'package:negai_frontend_main/app/modules/editor-midia/components/remover_component.dart';
import 'package:negai_frontend_main/app/shared/components/custom_app_bar_widget.dart';
import 'editor_midia_controller.dart';

class EditorMidiaPage extends StatefulWidget {
  
  final String title;
  final Midia midia;
  const EditorMidiaPage({Key key, this.title = "EditorMidia", this.midia}) : super(key: key);

  @override
  _EditorMidiaPageState createState() => _EditorMidiaPageState();
}

class _EditorMidiaPageState extends ModularState<EditorMidiaPage, EditorMidiaController> {
  LabeledGlobalKey<FormState> _formKey = Modular.get<LabeledGlobalKey<FormState>>();
  EditorMidiaController editorMidiaController = Modular.get<EditorMidiaController>();

  @override 
  void initState(){
    super.initState();
    editorMidiaController.load(widget.midia);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: CustomAppBar(
        title: widget.title,
        leading: true,
      ),
      body: ListView(
        shrinkWrap: true, 
        reverse: false, 
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                RemoverComponent()
              ],
            ),
          )
        ]
      )
    );
  }
}
  