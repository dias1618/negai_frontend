// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupControllerBase, Store {
  final _$_tabControllerAtom =
      Atom(name: '_SignupControllerBase._tabController');

  @override
  TabController get _tabController {
    _$_tabControllerAtom.reportRead();
    return super._tabController;
  }

  @override
  set _tabController(TabController value) {
    _$_tabControllerAtom.reportWrite(value, super._tabController, () {
      super._tabController = value;
    });
  }

  final _$listTabViewModelAtom =
      Atom(name: '_SignupControllerBase.listTabViewModel');

  @override
  ObservableList<SignupTabViewModel> get listTabViewModel {
    _$listTabViewModelAtom.reportRead();
    return super.listTabViewModel;
  }

  @override
  set listTabViewModel(ObservableList<SignupTabViewModel> value) {
    _$listTabViewModelAtom.reportWrite(value, super.listTabViewModel, () {
      super.listTabViewModel = value;
    });
  }

  final _$_nomeControllerAtom =
      Atom(name: '_SignupControllerBase._nomeController');

  @override
  TextEditingController get _nomeController {
    _$_nomeControllerAtom.reportRead();
    return super._nomeController;
  }

  @override
  set _nomeController(TextEditingController value) {
    _$_nomeControllerAtom.reportWrite(value, super._nomeController, () {
      super._nomeController = value;
    });
  }

  final _$_idControllerAtom = Atom(name: '_SignupControllerBase._idController');

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
      Atom(name: '_SignupControllerBase._senhaController');

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

  final _$_confirmarSenhaControllerAtom =
      Atom(name: '_SignupControllerBase._confirmarSenhaController');

  @override
  TextEditingController get _confirmarSenhaController {
    _$_confirmarSenhaControllerAtom.reportRead();
    return super._confirmarSenhaController;
  }

  @override
  set _confirmarSenhaController(TextEditingController value) {
    _$_confirmarSenhaControllerAtom
        .reportWrite(value, super._confirmarSenhaController, () {
      super._confirmarSenhaController = value;
    });
  }

  final _$categoriasAtom = Atom(name: '_SignupControllerBase.categorias');

  @override
  ObservableList<CategoriaSelecaoViewModel> get categorias {
    _$categoriasAtom.reportRead();
    return super.categorias;
  }

  @override
  set categorias(ObservableList<CategoriaSelecaoViewModel> value) {
    _$categoriasAtom.reportWrite(value, super.categorias, () {
      super.categorias = value;
    });
  }

  final _$_SignupControllerBaseActionController =
      ActionController(name: '_SignupControllerBase');

  @override
  TextEditingController nomeController() {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.nomeController');
    try {
      return super.nomeController();
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController idController() {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.idController');
    try {
      return super.idController();
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController senhaController() {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.senhaController');
    try {
      return super.senhaController();
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TextEditingController confirmarSenhaController() {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.confirmarSenhaController');
    try {
      return super.confirmarSenhaController();
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listTabViewModel: ${listTabViewModel},
categorias: ${categorias}
    ''';
  }
}
