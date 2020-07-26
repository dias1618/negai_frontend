import 'package:aquila_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/parameter_repository.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoriaRepository{
 
  RepositoryManager repositoryManager = Modular.get<DioRepositoryManager>();

  Future<RepositoryDto> get() async{
    RepositoryDto repositoryDto = await repositoryManager.read(
      ParameterRepository(
        data: {
          "path": "/categorias"
        }
      ), 
    );
    return repositoryDto;
  }
}