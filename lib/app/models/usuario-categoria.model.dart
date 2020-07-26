import 'package:aquila_frontend_main/app/models/categoria.model.dart';
import 'package:aquila_frontend_main/app/models/model.dart';
import 'package:aquila_frontend_main/app/models/usuario.model.dart';

class UsuarioCategoriaModel implements Model {
  String id;
  UsuarioModel usuario;
  Categoria categoria;

  UsuarioCategoriaModel({this.id, this.usuario, this.categoria});

  UsuarioCategoriaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario = UsuarioModel.fromJson(json['usuario']);
    categoria = Categoria.fromJson(json['categoria']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usuario'] = this.usuario.toJson();
    data['categoria'] = this.categoria.toJson();
    return data;
  }
}