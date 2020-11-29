import 'dart:io';

import 'package:negai_frontend_main/app/shared/manager-repositories/parameter_repository.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository.dto.dart';
import 'package:negai_frontend_main/app/shared/manager-repositories/repository_manager.dart';
import 'package:dio/dio.dart';

class DioRepositoryManager implements RepositoryManager{
  
  BaseOptions options;
  Dio dio;

  DioRepositoryManager(){
    options = new BaseOptions(
      //baseUrl: "http://dias1618.host:3000",
      baseUrl: "http://10.0.0.159:3000",
      connectTimeout: 5000,
    );

    dio = new Dio(options);
  }

  @override
  Future<RepositoryDto> execute(ParameterRepository parametros, dynamic data) async {
    return await create(parametros, data);
  }

  @override
  Future<RepositoryDto> create(ParameterRepository parametros, dynamic data) async {
    try{
      Response response;
      response = await dio.post(parametros.data['path'], data: data);
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
    try{
      Response response;
      response = await dio.delete(parametros.data['path']);
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
  Future<RepositoryDto> read(ParameterRepository parametros) async {
    try{
      Response response;
      response = await dio.get(parametros.data['path']);
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
  Future<RepositoryDto> update(ParameterRepository parametros, dynamic data) async {
    try{
      print(data);
      Response response;
      response = await dio.patch(parametros.data['path'], data: data);
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

  RepositoryDto constructRepositoryDto(Response response){
    return RepositoryDto(
      statusCode: (response.statusCode == 200 ? RepositoryManager.STATUS_OK : RepositoryManager.STATUS_ERROR), 
      statusMessage: response.statusMessage, 
      data: response.data
    );
  }

}