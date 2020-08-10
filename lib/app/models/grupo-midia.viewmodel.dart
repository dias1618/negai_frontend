class GrupoMidiaViewModel {
  int id;
  String titulo;
  bool expandido;

  GrupoMidiaViewModel({this.id, this.titulo, this.expandido});

  GrupoMidiaViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    expandido = json['expandido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['expandido'] = this.expandido;
    return data;
  }
}