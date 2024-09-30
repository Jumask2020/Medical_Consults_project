import 'dart:io';

import 'package:dio/dio.dart';

class HttpHelper extends HttpOverrides {
  HttpHelper._();
  static HttpHelper? _httpHelper;
  static HttpHelper get instance {
    _httpHelper ??= HttpHelper._();
    return _httpHelper!;
  }

  Dio dio = Dio();

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }

  Future<Response> getRequest({required String url}) async {
    return await dio.get(url);
  }

  Future<Response> postRequest(
      {required String url, required dynamic data, Options? options}) async {
    return await dio.post(url, data: data, options: options);
  }
}
