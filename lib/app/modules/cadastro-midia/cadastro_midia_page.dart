import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/models/situacao-acompanhamento.model.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/components/grupo_midia_component.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/components/imagem_component.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/components/situacao_midia_component.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/components/titulo_component.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/components/ultimo_visto_component.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/components/situacao_acompanhamento_component.dart';
import 'package:negai_frontend_main/app/shared/components/custom_app_bar_widget.dart';
import 'cadastro_midia_controller.dart';

class CadastroMidiaPage extends StatefulWidget {
  
  final String title;
  const CadastroMidiaPage({Key key, this.title = "CadastroMidia"}) : super(key: key);

  @override
  _CadastroMidiaPageState createState() => _CadastroMidiaPageState();
}

class _CadastroMidiaPageState extends ModularState<CadastroMidiaPage, CadastroMidiaController> {
  //use 'controller' variable to access controller
  
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
          Column(
            children: <Widget>[
              GrupoMidiaComponent(),
              TituloComponent(),
              ImagemComponent(),
              SituacaoMidiaComponent(),
              UltimoVistoComponent(),
              SituacaoAcompanhamentoComponent()
            ],
          ),
        ]
      )
    );
  }
}
  