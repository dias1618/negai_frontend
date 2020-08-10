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

  @override
  String toString() {
    return '''
grupoMidiaValue: ${grupoMidiaValue}
    ''';
  }
}
