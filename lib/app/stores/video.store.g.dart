// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoStore on _VideoStoreBase, Store {
  final _$videoAtualAtom = Atom(name: '_VideoStoreBase.videoAtual');

  @override
  VideoModel get videoAtual {
    _$videoAtualAtom.reportRead();
    return super.videoAtual;
  }

  @override
  set videoAtual(VideoModel value) {
    _$videoAtualAtom.reportWrite(value, super.videoAtual, () {
      super.videoAtual = value;
    });
  }

  final _$videosAtom = Atom(name: '_VideoStoreBase.videos');

  @override
  ObservableList<VideoModel> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(ObservableList<VideoModel> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  final _$youtubePlayerControllerAtom =
      Atom(name: '_VideoStoreBase.youtubePlayerController');

  @override
  YoutubePlayerController get youtubePlayerController {
    _$youtubePlayerControllerAtom.reportRead();
    return super.youtubePlayerController;
  }

  @override
  set youtubePlayerController(YoutubePlayerController value) {
    _$youtubePlayerControllerAtom
        .reportWrite(value, super.youtubePlayerController, () {
      super.youtubePlayerController = value;
    });
  }

  @override
  String toString() {
    return '''
videoAtual: ${videoAtual},
videos: ${videos},
youtubePlayerController: ${youtubePlayerController}
    ''';
  }
}
