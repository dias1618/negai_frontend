// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$notaVideoAtom = Atom(name: '_HomeControllerBase.notaVideo');

  @override
  int get notaVideo {
    _$notaVideoAtom.reportRead();
    return super.notaVideo;
  }

  @override
  set notaVideo(int value) {
    _$notaVideoAtom.reportWrite(value, super.notaVideo, () {
      super.notaVideo = value;
    });
  }

  final _$initVideosAsyncAction = AsyncAction('_HomeControllerBase.initVideos');

  @override
  Future<dynamic> initVideos() {
    return _$initVideosAsyncAction.run(() => super.initVideos());
  }

  final _$openSaibaMaisAsyncAction =
      AsyncAction('_HomeControllerBase.openSaibaMais');

  @override
  Future<void> openSaibaMais(dynamic context) {
    return _$openSaibaMaisAsyncAction.run(() => super.openSaibaMais(context));
  }

  final _$passarVideoAsyncAction =
      AsyncAction('_HomeControllerBase.passarVideo');

  @override
  Future<void> passarVideo() {
    return _$passarVideoAsyncAction.run(() => super.passarVideo());
  }

  @override
  String toString() {
    return '''
notaVideo: ${notaVideo}
    ''';
  }
}
