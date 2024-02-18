import 'dart:io';

import 'package:dio/dio.dart';

class DioHelper{
  static Dio ?dio;

  static void initialDioHelper(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required Map<String,dynamic> query
  })async{
    return await dio!.get(
      'v2/top-headlines',
      queryParameters: query,
    );
  }

}