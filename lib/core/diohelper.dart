import 'package:dio/dio.dart';
import 'package:taskmanager/core/cacheHelper.dart';

class DioHelper{
  static Dio ?dio;
  static init ()
  {
    dio=Dio(BaseOptions(
        baseUrl:'https://tasksapp.integration25.com/api/',
        headers: {
      'Accept':'application/json',
    }));

  }
 static Future<Response> postData({
   final String? endPoint,
   Map<String,dynamic>?data,
   String? token,
   Options ?options,
}

     )async
  {
  return  await dio!.post(options:options,
      endPoint!,
      data:data,

       );
  }
static Future<Response>getData({ required String endPoint})async
{
  return await dio!.get(endPoint,options: Options(headers: {
    'Authorization':'Bearer${CacheHelper.getData(key: 'token')}'
  }));
}
}