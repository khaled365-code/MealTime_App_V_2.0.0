


import 'package:dio/dio.dart';

import '../errors/server_exception.dart';
import 'api_consumer.dart';
import 'api_interceptor.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer
{

  final Dio dio;

  DioConsumer({required this.dio})
  {
    dio.options.baseUrl=EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      error: true,
      requestBody: true,
      requestHeader: true,
      request: true,
      responseHeader: true,
      responseBody: true,
      logPrint: print,
    ));
  }


  @override
  Future<dynamic> delete(String pathName, {dynamic data, Map<String, dynamic>? queryParams,bool formData=false}) async
  {
    try
    {

      final response=await dio.delete(pathName,data :formData? FormData.fromMap(data):data,queryParameters: queryParams);
      return response.data;
    }on DioException catch(e)
    {
      handleExceptions(e);
    }
  }

  @override
  Future<dynamic> get(String pathName,
      {Object? data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(
          pathName, data: data, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e)
    {
      handleExceptions(e);
    }
  }


  @override
  Future<dynamic> patch(String pathName, {dynamic data, Map<String, dynamic>? queryParams,bool formData=false}) async {
    try{

      final response=await dio.patch(pathName,data :formData? FormData.fromMap(data):data,queryParameters: queryParams);
       return response.data;
    }on DioException catch(e)
    {
      handleExceptions(e);
    }
  }

  @override
  Future<dynamic> post(String pathName, {dynamic data, Map<String,dynamic>? queryParams,bool formData=false,}) async {
    try{

      final response=await dio.post(pathName, data :formData? FormData.fromMap(data):data,queryParameters: queryParams);
      return response.data;
    }on DioException catch(e)
    {
      handleExceptions(e);
    }
  }
}
