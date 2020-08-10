import 'package:mobx/mobx.dart';
import 'package:negai_frontend_main/app/models/grupo-midia.viewmodel.dart';

part 'grupo_midia_store.g.dart';

class GrupoMidiaStore = _GrupoMidiaStoreBase with _$GrupoMidiaStore;

abstract class _GrupoMidiaStoreBase with Store {
  
  @observable
  ObservableList<GrupoMidiaViewModel> gruposMidia = ObservableList.of({});

}
