import 'package:aquila_frontend_main/app/models/model.dart';
import 'package:aquila_frontend_main/app/models/usuario.model.dart';
import 'package:aquila_frontend_main/app/models/video.model.dart';

class UsuarioVideoModel implements Model{
  int id;
  UsuarioModel usuario;
  VideoModel video;

  UsuarioVideoModel({this.id, this.usuario, this.video});

  UsuarioVideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario = json['usuario'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usuario'] = this.usuario.toJson();
    data['video'] = this.video.toJson();
    return data;
  }
}