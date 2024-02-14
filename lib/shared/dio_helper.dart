import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://mafhoom-api.onrender.com/users/",
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "application/json"},
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> quary,
  }) async {
    return await dio!.get(
      url,
      queryParameters: quary,
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? quary,
      required Map<String, dynamic> data}) async {
    return dio!.post(
      url,
      queryParameters: quary,
      data: data,
    );
  }
}