
//1 path -2/body-3/params
abstract class ApiConsumer
{
  Future<dynamic>  get(String pathName,{Object? data,Map<String,dynamic>? queryParams,});

  Future<dynamic>   post(String pathName,{Object? data,Map<String,dynamic>? queryParams,bool formData=false});

  Future<dynamic>  patch(String pathName,{Object? data,Map<String,dynamic>? queryParams,bool formData=false});

  Future<dynamic>  delete(String pathName,{Object? data,Map<String,dynamic>? queryParams,bool formData=false});






}