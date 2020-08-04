import 'package:aquila_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/parameter_repository.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:aquila_frontend_main/app/stores/usuario.store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VideoRepository{

  RepositoryManager repositoryManager = Modular.get<DioRepositoryManager>();
  UsuarioStore usuarioStore = Modular.get<UsuarioStore>();

  Future<RepositoryDto> getVideos() async{
    RepositoryDto repositoryDto = await repositoryManager.read(
      ParameterRepository(
        data: {
          "path": "/videos?idUsuario=${usuarioStore.usuario.id}"
        }
      )
    );
    return repositoryDto;
  }

}