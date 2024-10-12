import 'dart:io';

import 'package:dio/dio.dart';

import 'storge_helper.dart';

class HttpHelper {
  HttpHelper._();
  static HttpHelper? _httpHelper;
  static HttpHelper get instance {
    _httpHelper ??= HttpHelper._();
    return _httpHelper!;
  }

  Dio dio = Dio();

  Map<String, String> header() {
    final StorgeHelper storageHelper = StorgeHelper.instance;
    // String token = storageHelper.readKey('token');
    final Map<String, String> header = {
      // 'authorization': 'Bearer $token',
      'authorization':
          'Bearer  40|KZeLmXWIqkD2ueyBmjwsT1lexHahCZtpZjzJ1slA3dbf8b32',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    return header;
  }

  Future<Response> getRequest({required String url, Options? options}) async {
    return await dio.get(url, options: options);
  }

  Future<Response> postRequest(
      {required String url, required dynamic data, Options? options}) async {
    return await dio.post(url, data: data, options: options);
  }
}
