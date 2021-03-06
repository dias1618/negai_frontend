import 'package:negai_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/parameter_repository.dart';

abstract class RepositoryManager{

  static const int STATUS_OK    = 0;
  static const int STATUS_ERROR = 1;

  Future<RepositoryDto> execute(ParameterRepository parametros, dynamic data);
  Future<RepositoryDto> create(ParameterRepository parametros, dynamic data);
  Future<RepositoryDto> read(ParameterRepository parametros);
  Future<RepositoryDto> update(ParameterRepository parametros, dynamic data);
  Future<RepositoryDto> delete(ParameterRepository parametros);
}