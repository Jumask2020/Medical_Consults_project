import 'package:dio/dio.dart';

class HttpHelper {
  HttpHelper._();
  static HttpHelper? _httpHelper;
  static HttpHelper get instance {
    _httpHelper ??= HttpHelper._();
    return _httpHelper!;
  }

  Dio dio = Dio();

  Future<Response> getRequest({required String url}) async {
    return await dio.get(url);
  }

  postRequest(
      {required String url, required dynamic data, Options? options}) async {
    return await dio.post(url, data: data, options: options);
  }
}
