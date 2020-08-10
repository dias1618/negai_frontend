class GrupoMidiaModel {
  int id;
  String titulo;

  GrupoMidiaModel({this.id, this.titulo});

  GrupoMidiaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    return data;
  }
}