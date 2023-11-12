import 'dart:developer';
import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    return await dio
        .get(url,
            options: Options(
                headers: {"content-Type": "application/json"},
                responseType: ResponseType.json,
                method: 'GET'))
        .then((response) {
      log(response.toString());
      return response;
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = "application/json";
    return await dio
        .post(url,
            data: map,
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((response) {
      log(response.headers.toString());
      log(response.data.toString());
      log(response.statusCode.toString());
      return response;
    });
  }
}
