import 'package:aquila_frontend_main/app/models/viewmodel.dart';

class CategoriaSelecaoViewModel implements ViewModel{
  int id;
  String nome;
  int idPlatform;
  bool checked;

  CategoriaSelecaoViewModel(
      {this.id, this.nome, this.idPlatform, this.checked});

  CategoriaSelecaoViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    idPlatform = json['idPlatform'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['idPlatform'] = this.idPlatform;
    data['checked'] = this.checked;
    return data;
  }
}