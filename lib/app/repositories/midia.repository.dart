import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/parameter_repository.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository_manager.dart';

class MidiaRepository{

  RepositoryManager repositoryManager = Modular.get<DioRepositoryManager>();

  Future<RepositoryDto> getGruposMidia() async{

    RepositoryDto repositoryDto = await repositoryManager.read(
      ParameterRepository(
        data: {
          "path": "/grupomidia"
        }
      )
    );

    return repositoryDto;
  }

}