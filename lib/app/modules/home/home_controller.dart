import 'package:flutter/material.dart';
import 'package:negai_frontend_main/app/models/grupo-midia.model.dart';
import 'package:negai_frontend_main/app/models/grupo-midia.viewmodel.dart';
import 'package:negai_frontend_main/app/models/item-panel.viewmodel.dart';
import 'package:negai_frontend_main/app/models/midia.model.dart';
import 'package:negai_frontend_main/app/repositories/midia.repository.dart';
import 'package:negai_frontend_main/app/services/loading-manager/loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:negai_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:negai_frontend_main/app/stores/grupo_midia_store.dart';
import 'package:negai_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();
  MidiaRepository midiaRepository = Modular.get<MidiaRepository>();
  GrupoMidiaStore grupoMidiaStore = Modular.get<GrupoMidiaStore>();

  List<ItemPanelViewModel> items = <ItemPanelViewModel>[
    ItemPanelViewModel(
      isExpanded: false,
      header: 'Header',
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text('data'),
            Text('data'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('data'),
                Text('data'),
                Text('data'),
              ],
            ),
            Radio(value: null, groupValue: null, onChanged: null)  //put the children here
          ]
        )
      ),
      iconpic: Icons.image
    ),
  ];

  init() async{
    progressDialogService.showLoading('Carregando...');
    RepositoryDto repositoryDto = await midiaRepository.getGruposMidia();
    if (repositoryDto.statusCode == RepositoryManager.STATUS_OK) {
      for(var element in repositoryDto.data) {
        GrupoMidiaViewModel grupoMidiaViewModel = GrupoMidiaViewModel.fromJson(element);

        repositoryDto = await midiaRepository.getMidia(grupoMidiaViewModel.id);
        if(repositoryDto.statusCode == RepositoryManager.STATUS_OK){
          for(var element in repositoryDto.data){
            grupoMidiaViewModel.addMidia(Midia.fromJson(element));
          }
        } else {
          progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
        }

        grupoMidiaViewModel.expandido = false;

        print(grupoMidiaViewModel.toJson());

        grupoMidiaStore.gruposMidia.add(grupoMidiaViewModel);
      }
      
    } else {
      progressDialogService.hideLoading(repositoryDto.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }
  }

  cadastrarMidia(){
    Modular.to.pushNamed('/cadastro-midia');
  }

}
