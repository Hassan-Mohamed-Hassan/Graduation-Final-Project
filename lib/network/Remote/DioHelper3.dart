import 'package:dio/dio.dart';

class DioHelper{
  static  Dio? dio;

  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'http://localhost:8000/api/',
          receiveDataWhenStatusError: true,
        )

    );
  }

  static Future<Response>  getData({
    required String url,
    Map<String,dynamic>? query,
    required String token

  })async{
    dio!.options.headers={
      'Content-Type':'application/json',
      'Authorization':'Bearer $token',


    };

    return await   dio!.get(
        url,
        queryParameters: query
    );
  }


  static  Future<Response>  postData(
      {
        required String url,
         Map<String ,dynamic >? query,
        Map<String,dynamic>? data,
          String? token

      }
      )async{
    dio!.options.headers={
      'Content-Type':'application/json',

      'Authorization':'Bearer $token',


    };
    return await  dio!.post(
        url,
        data: data,
        queryParameters: query,

    );

  }

  static  Future<Response>  UplaodImage(
      {
        required String url,
        Map<String ,dynamic >? query,
        Map<String,dynamic>? data,
        String? token

      }
      )async{
    dio!.options.headers={
      'Content-Type':'multipart/form-data',

      'Authorization':'Bearer $token',


    };
    return await  dio!.post(
      url,
      data: data,

      queryParameters: query,

    );

  }
  static  Future<Response>  DeleteData(
      {
        required String url,
        String? token

      }
      )async{
    dio!.options.headers={
      'Content-Type':'application/json',

      'Authorization':'Bearer $token',


    };
    return await  dio!.delete(
      url
    );

  }

  static  Future<Response>  PutData(
      {
        required String url,
        required Map<String ,dynamic > query,
        Map<String,dynamic>? data,
        String? lang='en',
        String? token,

      }
      )async{
    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':'Bearer $token',


    };
    return await  dio!.put(
        url,
        data: data,
        queryParameters: query
    );

  }
}