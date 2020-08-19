import 'package:negai_frontend_main/app/models/midia.model.dart';

class GrupoMidia {
  int id;
  String titulo;
  List<Midia> midias;

  GrupoMidia({this.id, this.titulo, this.midias});

  GrupoMidia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    if(json['midias'] != null){
      if(midias == null)
        midias = new List<Midia>();
      for(var midia in json['midias']){
        midias.add((midia is Midia ? midia : Midia.fromJson(midia)));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['midias'] = this.midias;
    return data;
  }
}