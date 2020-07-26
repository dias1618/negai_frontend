import 'package:aquila_frontend_main/app/models/login.viewmodel.dart';
import 'package:aquila_frontend_main/app/models/usuario-categoria.model.dart';
import 'package:aquila_frontend_main/app/models/usuario.model.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/parameter_repository.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsuarioRespository{

  RepositoryManager repositoryManager = Modular.get<DioRepositoryManager>();

  Future<RepositoryDto> createUsuario(UsuarioModel usuario, List<UsuarioCategoriaModel> usuariosCategorias) async{

    RepositoryDto repositoryDto = await repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/usuarios/signup"
        }
      ), 
      {
        "usuario": usuario.toJson(),
        "usuarioCategorias": usuariosCategorias.map((usuarioCategoria) => usuarioCategoria.toJson()).toList()
      }
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