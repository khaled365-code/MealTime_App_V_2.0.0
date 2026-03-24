import 'package:dio/dio.dart';

import '../cache/cache_helper.dart';
import 'api_keys.dart';

class ApiInterceptor extends Interceptor
{
  @override
  void onRequest(
    RequestOptions options, RequestInterceptorHandler handler,)
  {
    if (options.contentType == null)
    {
      final dynamic data = options.data;
      final String? contentType;
      if (data is FormData)
      {
        contentType = Headers.multipartFormDataContentType;
      }
      else if (data is Map)
      {
        contentType = Headers.formUrlEncodedContentType;
      } else if (data is String)
      {
        contentType = Headers.jsonContentType;
      } else if (data != null)
      {
        contentType = Headers.textPlainContentType; // Can be removed if unnecessary.
      } else
      {
        contentType = null;
      }
      options.contentType = contentType;
    }
    handler.next(options);
    options.headers[ApiKeys.token]=CacheHelper().getData(key: ApiKeys.token) !=null ?
    'FOODAPI ${CacheHelper().getData(key: ApiKeys.token)}':null;


  }
}


