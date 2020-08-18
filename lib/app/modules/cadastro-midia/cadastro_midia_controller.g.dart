// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_midia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroMidiaController on _CadastroMidiaControllerBase, Store {
  final _$grupoMidiaValueAtom =
      Atom(name: '_CadastroMidiaControllerBase.grupoMidiaValue');

  @override
  GrupoMidiaViewModel get grupoMidiaValue {
    _$grupoMidiaValueAtom.reportRead();
    return super.grupoMidiaValue;
  }

  @override
  set grupoMidiaValue(GrupoMidiaViewModel value) {
    _$grupoMidiaValueAtom.reportWrite(value, super.grupoMidiaValue, () {
      super.grupoMidiaValue = value;
    });
  }

  final _$situacaoMidiaValueAtom =
      Atom(name: '_CadastroMidiaControllerBase.situacaoMidiaValue');

  @override
  SituacaoMidia get situacaoMidiaValue {
    _$situacaoMidiaValueAtom.reportRead();
    return super.situacaoMidiaValue;
  }

  @override
  set situacaoMidiaValue(SituacaoMidia value) {
    _$situacaoMidiaValueAtom.reportWrite(value, super.situacaoMidiaValue, () {
      super.situacaoMidiaValue = value;
    });
  }

  final _$situacaoAcompanhamentoValueAtom =
      Atom(name: '_CadastroMidiaControllerBase.situacaoAcompanhamentoValue');

  @override
  SituacaoAcompanhamento get situacaoAcompanhamentoValue {
    _$situacaoAcompanhamentoValueAtom.reportRead();
    return super.situacaoAcompanhamentoValue;
  }

  @override
  set situacaoAcompanhamentoValue(SituacaoAcompanhamento value) {
    _$situacaoAcompanhamentoValueAtom
        .reportWrite(value, super.situacaoAcompanhamentoValue, () {
      super.situacaoAcompanhamentoValue = value;
    });
  }

  final _$imageFileAtom = Atom(name: '_CadastroMidiaControllerBase.imageFile');

  @override
  PickedFile get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(PickedFile value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$tituloControllerAtom =
      Atom(name: '_CadastroMidiaControllerBase.tituloController');

  @override
  TextEditingController get tituloController {
    _$tituloControllerAtom.reportRead();
    return super.tituloController;
  }

  @override
  set tituloController(TextEditingController value) {
    _$tituloControllerAtom.reportWrite(value, super.tituloController, () {
      super.tituloController = value;
    });
  }

  final _$ultimoVistoControllerAtom =
      Atom(name: '_CadastroMidiaControllerBase.ultimoVistoController');

  @override
  TextEditingController get ultimoVistoController {
    _$ultimoVistoControllerAtom.reportRead();
    return super.ultimoVistoController;
  }

  @override
  set ultimoVistoController(TextEditingController value) {
    _$ultimoVistoControllerAtom.reportWrite(value, super.ultimoVistoController,
        () {
      super.ultimoVistoController = value;
    });
  }

  @override
  String toString() {
    return '''
grupoMidiaValue: ${grupoMidiaValue},
situacaoMidiaValue: ${situacaoMidiaValue},
situacaoAcompanhamentoValue: ${situacaoAcompanhamentoValue},
imageFile: ${imageFile},
tituloController: ${tituloController},
ultimoVistoController: ${ultimoVistoController}
    ''';
  }
}
