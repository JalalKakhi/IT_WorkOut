import 'package:dio/dio.dart';

class DioHelper{
  static Dio? dio;
  static initial(){
    dio=Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org/v2/everything?q=Apple&from=2025-05-12&sortBy=popularity&apiKey=f11088983fa94d7dad07a79759047544",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    Map<String,dynamic>? query,

})async
  {
    return await dio!.get(
      path,
      queryParameters: query,
    );
}

  static Future<Response> postData({
    required String path,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
})async
  {
    return await dio!.post(
      path,
      data:data,
      queryParameters: query,
    );
  }
}