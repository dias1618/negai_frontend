class Canal {
  int id;
  String idPlatform;
  String titulo;
  String descricao;
  String urlImagem;

  Canal(
      {this.id, this.idPlatform, this.titulo, this.descricao, this.urlImagem});

  Canal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPlatform = json['idPlatform'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    urlImagem = json['urlImagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idPlatform'] = this.idPlatform;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['urlImagem'] = this.urlImagem;
    return data;
  }
}