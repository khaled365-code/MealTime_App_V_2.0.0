



import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:new_meal_time_app/core/database/errors/error_model.dart';


class ServerException implements Exception
{
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleExceptions(DioException e)
{
  switch (e.type)
  {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode)
      {
        case 400:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 401:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 403:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 404:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 409:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 422:
          throw ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data));

        case 504:
          if(kDebugMode)
            {
              log("Exception with the server happened ${e.response?.data} with error : ${e.error} and status code ${e.response?.statusCode}" );
            }
          throw ServerException(
              errorModel: ErrorModel(
                error: [
                  "Problem with the server , Try again later"
                ],
                errorMessage: "Problem with the server , Try again later",
                status: 504,
              ));

        default:
          if(kDebugMode)
          {
            log("Exception happened ${e.response?.data} with error : ${e.error} and status code ${e.response?.statusCode}");
          }
          throw ServerException(
              errorModel:  ErrorModel(
                error:
                [
                  "Unknown Error please , Try again later"
                ],
                errorMessage: "Unknown Error please , Try again later",
                status: 504,
              ));
      }
    case DioExceptionType.cancel:
      throw ServerException(
          errorModel:ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(
          errorModel:ErrorModel.fromJson(e.response!.data));

    default:
      throw ServerException(
          errorModel: ErrorModel.fromJson(e.response!.data));
  }
}
