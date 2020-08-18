import 'package:negai_frontend_main/app/models/midia.model.dart';

class GrupoMidia {
  int id;
  String titulo;
  List<Midia> midias;

  GrupoMidia({this.id, this.titulo, this.midias});

  GrupoMidia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    midias = json['midias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['midias'] = this.midias;
    return data;
  }
}