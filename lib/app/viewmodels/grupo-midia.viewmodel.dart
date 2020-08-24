import 'package:mobx/mobx.dart';
import 'package:negai_frontend_main/app/models/midia.model.dart';

class GrupoMidiaViewModel {
  int id;
  String titulo;
  bool expandido;

  @observable
  ObservableList<Midia> midias;

  GrupoMidiaViewModel({this.id, this.titulo, this.expandido, this.midias});

  GrupoMidiaViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    expandido = json['expandido'];
    midias = json['midias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['expandido'] = this.expandido;
    data['midias'] = this.midias;
    return data;
  }

  addMidia(Midia midia){
    if(midias == null)
      midias = new ObservableList<Midia>();

    midias.add(midia);
  }

  removeMidia(int id){
    midias.remove(midias.firstWhere((midia) => midia.id == id));
  }

  updateMidia(Midia midia){
    for(int index=0; index < midias.length; index++){
      if(midias[index].id == midia.id){
        midias[index] = Midia.fromJson(midia.toJson());
      }
    }
  }
}