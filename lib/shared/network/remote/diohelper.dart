import 'package:dio/dio.dart';
import 'package:shop_app/modules/onbordingscreen/onboardscreen.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 10 * 1000,
        receiveTimeout: 10 * 1000,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    query,
    required data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return dio!.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    query,
    required data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return dio!.put(url, queryParameters: query, data: data);
  }
}
