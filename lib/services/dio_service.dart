import 'dart:developer';

import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    //dio.options.headers['content-type'] = "application/json";
    await dio
        .get(url,
            options: Options(
                headers: {"content-type": "application/json"},
                method: "GET",
                responseType: ResponseType.json))
        .then((response) {
      log(response.toString());
      return response;
    });
  }
}
