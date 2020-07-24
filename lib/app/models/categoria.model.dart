class Categoria {
  int id;
  String nome;
  int idPlatform;

  Categoria({this.id, this.nome, this.idPlatform});

  Categoria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    idPlatform = json['idPlatform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['idPlatform'] = this.idPlatform;
    return data;
  }
}