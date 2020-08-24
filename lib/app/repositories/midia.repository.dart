import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/models/midia.model.dart';
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

  Future<RepositoryDto> getMidia(int idGrupoMidia) async{
    RepositoryDto repositoryDto = await repositoryManager.read(
      ParameterRepository(
        data: {
          "path": "/midia?idGrupoMidia=$idGrupoMidia"
        }
      )
    );
    return repositoryDto;
  }

  Future<RepositoryDto> saveMidia(Midia midia) async{
    RepositoryDto repositoryDto = await repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/midia"
        }
      ), 
      midia.toJson()
    );
    return repositoryDto;
  }

  Future<RepositoryDto> removerMidia(int id) async{
    RepositoryDto repositoryDto = await repositoryManager.delete(
      ParameterRepository(
        data: {
          "path": "/midia/$id"
        }
      ),
    );
    return repositoryDto;
  }



}