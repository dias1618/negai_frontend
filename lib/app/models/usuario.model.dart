import 'package:aquila_frontend_main/app/models/model.dart';

class UsuarioModel implements Model {
  int id;
  String nome;
  String login;
  String senha;

  UsuarioModel({this.id, this.nome, this.login, this.senha});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    login = json['login'];
    senha = json['senha'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['login'] = this.login;
    data['senha'] = this.senha;
    return data;
  }
}