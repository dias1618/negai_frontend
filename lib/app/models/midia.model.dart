import 'package:negai_frontend_main/app/models/grupo-midia.model.dart';

class Midia {
  int id;
  String titulo;
  String icone;
  int situacaoMidia;
  int situacaoAcompanhamento;
  int ultimoVisto;
  GrupoMidia grupoMidia;

  Midia(
      {this.id,
      this.titulo,
      this.icone,
      this.situacaoMidia,
      this.situacaoAcompanhamento,
      this.ultimoVisto,
      this.grupoMidia});

  Midia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    icone = json['icone'];
    situacaoMidia = json['situacaoMidia'];
    situacaoAcompanhamento = json['situacaoAcompanhamento'];
    ultimoVisto = json['ultimoVisto'];
    grupoMidia = GrupoMidia.fromJson(json['grupoMidia']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['icone'] = this.icone;
    data['situacaoMidia'] = this.situacaoMidia;
    data['situacaoAcompanhamento'] = this.situacaoAcompanhamento;
    data['ultimoVisto'] = this.ultimoVisto;
    data['grupoMidia'] = this.grupoMidia.toJson();
    return data;
  }
}