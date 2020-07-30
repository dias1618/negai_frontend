


import 'package:aquila_frontend_main/app/models/usuario-video.model.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/parameter_repository.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoryRepository{

  RepositoryManager repositoryManager = Modular.get<DioRepositoryManager>();

  Future<RepositoryDto> save(UsuarioVideoModel usuarioVideo) async{
    RepositoryDto repositoryDto = await repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/history"
        }
      ), 
      usuarioVideo.toJson()
    );
    return repositoryDto;
  }
}