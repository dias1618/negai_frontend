import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:negai_frontend_main/app/models/midia.model.dart';
import 'package:negai_frontend_main/app/repositories/situacao_acompanhamento.repository.dart';
import 'package:negai_frontend_main/app/repositories/situacao_midia.repository.dart';
import 'package:negai_frontend_main/app/stores/grupo_midia_store.dart';
import 'package:negai_frontend_main/app/viewmodels/grupo-midia.viewmodel.dart';
import 'package:negai_frontend_main/app/models/situacao-midia.model.dart';
import 'package:negai_frontend_main/app/models/situacao-acompanhamento.model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


class CadastroMidiaViewModel{

  @observable
  int id;
  @observable
  GrupoMidiaViewModel grupoMidiaValue;
  @observable
  SituacaoMidia situacaoMidiaValue;
  @observable
  SituacaoAcompanhamento situacaoAcompanhamentoValue;
  @observable
  PickedFile imageFile;
  @observable
  TextEditingController tituloController = new TextEditingController();
  @observable
  TextEditingController ultimoVistoController = new TextEditingController();

  SituacaoMidiaRepository situacaoMidiaRepository = Modular.get<SituacaoMidiaRepository>();
  SituacaoAcompanhamentoRepository situacaoAcompanhamentoRepository = Modular.get<SituacaoAcompanhamentoRepository>();
  GrupoMidiaStore grupoMidiaStore = Modular.get<GrupoMidiaStore>();

  CadastroMidiaViewModel({Midia midia}){
    if(midia != null){
      this.id = midia.id;
      this.grupoMidiaValue = grupoMidiaStore.getById(midia.grupoMidia.id);
      this.situacaoMidiaValue = situacaoMidiaRepository.situacoes.firstWhere((SituacaoMidia situacaoMidia) => situacaoMidia.value == midia.situacaoMidia);
      this.situacaoAcompanhamentoValue = situacaoAcompanhamentoRepository.situacoes.firstWhere((SituacaoAcompanhamento situacaoAcompanhamento) => situacaoAcompanhamento.value == midia.situacaoAcompanhamento);
      this.tituloController.text = midia.titulo;
      this.ultimoVistoController.text = midia.ultimoVisto.toString();
    }
  }
}