import 'package:dio/dio.dart';

class DioHelper{
  static Dio ?dio;
  static init ()
  {
    dio=Dio(BaseOptions(baseUrl:'https://tasksapp.integration25.com/api/',headers: {
      'Accept':'application/json',
    }));

  }
 static Future<Response> postData( String endPoint, String email,String password)async
  {
  return  await dio!.post(endPoint,
      data: {
        'email':email,
        'password':password
      }
       );
  }

}