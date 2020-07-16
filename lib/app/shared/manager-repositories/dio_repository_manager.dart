import 'dart:io';

import 'package:aquila_frontend_main/app/models/model.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/parameter_repository.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:aquila_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:dio/dio.dart';

class DioRepositoryManager implements RepositoryManager{
  
  BaseOptions options;
  Dio dio;

  DioRepositoryManager(){
    options = new BaseOptions(
      baseUrl: "http://10.0.0.159:3000",
      connectTimeout: 5000,
    );

    dio = new Dio(options);
  }

  @override
  Future<RepositoryDto> execute(ParameterRepository parametros, Model data) async {
    return await create(parametros, data);
  }

  @override
  Future<RepositoryDto> create(ParameterRepository parametros, Model data) async {
    try{
      Response response;
      response = await dio.post(parametros.data['path'], data: data.toJson());
      return RepositoryDto(
        statusCode: RepositoryManager.STATUS_OK, 
        statusMessage: response.statusMessage, 
        data: response.data
      );
    } on DioError catch(dioException){
      if(dioException.type == DioErrorType.DEFAULT)
        return RepositoryDto(
          statusCode: RepositoryManager.STATUS_ERROR, 
          statusMessage: 'Erro de conexão', 
          data: null
        );
      else if(dioException.type == DioErrorType.CONNECT_TIMEOUT)
        return RepositoryDto(
          statusCode: RepositoryManager.STATUS_ERROR, 
          statusMessage: 'Tempo de conexão expirou', 
          data: null
        );
      else if(dioException.type == DioErrorType.RESPONSE){
        return RepositoryDto(
          statusCode: RepositoryManager.STATUS_ERROR, 
          statusMessage: dioException.response.data['message'], 
          data: null
        );
      }
    }
    
  }

  @override
  Future<RepositoryDto> delete(ParameterRepository parametros) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<RepositoryDto> read(ParameterRepository parametros) async {
    Response response;
    response = await dio.get(parametros.data['path']);
    return RepositoryDto(
      statusCode: response.statusCode, 
      statusMessage: response.statusMessage, 
      data: response.data
    );
  }

  @override
  Future<RepositoryDto> update(ParameterRepository parametros, Model data) async {
    // TODO: implement update
    throw UnimplementedError();
  }

  RepositoryDto constructRepositoryDto(Response response){
    return RepositoryDto(
      statusCode: (response.statusCode == 200 ? RepositoryManager.STATUS_OK : RepositoryManager.STATUS_ERROR), 
      statusMessage: response.statusMessage, 
      data: response.data
    );
  }

}