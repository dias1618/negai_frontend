// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$_idControllerAtom = Atom(name: '_LoginControllerBase._idController');

  @override
  TextEditingController get _idController {
    _$_idControllerAtom.reportRead();
    return super._idController;
  }

  @override
  set _idController(TextEditingController value) {
    _$_idControllerAtom.reportWrite(value, super._idController, () {
      super._idController = value;
    });
  }

  final _$_senhaControllerAtom =
      Atom(name: '_LoginControllerBase._senhaController');

  @override
  TextEditingController get _senhaController {
    _$_senhaControllerAtom.reportRead();
    return super._senhaController;
  }

  @override
  set _senhaController(TextEditingController value) {
    _$_senhaControllerAtom.reportWrite(value, super._senhaController, () {
      super._senhaController = value;
    });
  }

  final _$signupAsyncAction = AsyncAction('_LoginControllerBase.signup');

  @override
  Future<dynamic> signup() {
    return _$signupAsyncAction.run(() => super.signup());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  TextEditingController idController() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.idController');
    try {
      return super.idController();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController senhaController() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.senhaController');
    try {
      return super.senhaController();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
