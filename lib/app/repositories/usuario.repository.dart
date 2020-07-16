import 'package:aquila_frontend_main/app/models/login.viewmodel.dart';
import 'package:aquila_frontend_main/app/models/usuario.model.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/parameter_repository.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsuarioRespository{

  RepositoryManager repositoryManager = Modular.get<DioRepositoryManager>();

  Future<RepositoryDto> createUsuario(UsuarioModel usuario) async{
    RepositoryDto repositoryDto = await repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/usuarios"
        }
      ), 
      UsuarioModel.fromJson({
        "nome": usuario.nome,
        "login": usuario.login,
        "senha": usuario.senha
      })
    );

    return repositoryDto;
  }

  Future<RepositoryDto> login(LoginViewModel loginModel) async{
    RepositoryDto repositoryDto = await repositoryManager.execute(
      ParameterRepository(
        data: {
          "path": "/login"
        }
      ), 
      LoginViewModel.fromJson({
        "login": loginModel.login,
        "senha": loginModel.senha
      })
    );
    return repositoryDto;
  }

}