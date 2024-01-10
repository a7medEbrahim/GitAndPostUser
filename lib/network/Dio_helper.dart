import 'package:dio/dio.dart';
import 'package:task1/network/endpoint/end_point.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl, headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response> getData(
      {required String endPoints,
      Map<String, dynamic>? queryParameters,
      String? token}) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      var response = await dio.get(endPoints, queryParameters: queryParameters);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response> postData({
    required String endPoints,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      var response = await dio.post(endPoints, data: data);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
