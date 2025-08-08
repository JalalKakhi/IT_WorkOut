import 'package:dio/dio.dart';

class DioHelper{
  static Dio? dio;
  static initial(){
    dio=Dio(
      BaseOptions(
        baseUrl: "http://192.168.1.105:8000",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    Map<String,dynamic>? query,
    Map<String,dynamic>? header,

})async
  {
    return await dio!.get(
      path,
      queryParameters: query,
        options: Options(
            headers:header
        )
    );
}

  static Future<Response> postData({
    required String path,
    Map<String,dynamic>? query,
    Map<String,dynamic>? header,
    required Map<String,dynamic> data,
})async
  {
    return await dio!.post(
      path,
      data:data,
      queryParameters: query,
      options: Options(
        headers:header
      )
    );
  }
}