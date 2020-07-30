import 'package:aquila_frontend_main/app/models/canal.model.dart';
import 'package:aquila_frontend_main/app/models/categoria.model.dart';

class VideoModel {
  int id;
  String titulo;
  String descricao;
  String idPlatform;
  String url;
  int midia;
  String duracao;
  DateTime criado;
  String urlImage;

  Canal canal;
  Categoria categoria;

  VideoModel(
      {this.id,
      this.titulo,
      this.descricao,
      this.idPlatform,
      this.url,
      this.midia,
      this.duracao,
      this.criado,
      this.urlImage,
      this.canal,
      this.categoria});

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    idPlatform = json['idPlatform'];
    url = json['url'];
    midia = json['midia'];
    duracao = json['duracao'];
    criado = (json['criado'] != null ? DateTime.parse(json['criado']) : null);
    urlImage = json['urlImage'];
    canal = Canal.fromJson(json['canal']);
    categoria = Categoria.fromJson(json['categoria']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['idPlatform'] = this.idPlatform;
    data['url'] = this.url;
    data['midia'] = this.midia;
    data['duracao'] = this.duracao;
    data['criado'] = this.criado.toIso8601String();
    data['urlImage'] = this.urlImage;
    data['canal'] = this.canal.toJson();
    data['categoria'] = this.categoria.toJson();
    return data;
  }
}
