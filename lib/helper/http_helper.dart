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

  Map<String, dynamic> _header(String token) {
    Map<String, dynamic> header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    return header;
  }

  Future<Response> getRequest({required String url, String? token}) async {
    return await dio.get(url, options: Options(headers: _header(token!)));
  }

  Future<Response> postRequest(
      {required String url, required dynamic data, Options? options}) async {
    return await dio.post(url, data: data, options: options);
  }
}
