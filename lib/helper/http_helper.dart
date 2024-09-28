import 'package:dio/dio.dart';

class HttpHelper{

  HttpHelper._();
  static HttpHelper? httpHelper;

 static HttpHelper get instsnse{
    if(httpHelper==null)
      httpHelper=HttpHelper._();
    return httpHelper!;
  }

  Dio dio =Dio();

  Future<Response> postRequest({required String url ,required dynamic data , Options? options}) async {
    return await dio.post(url,data: data,options: options);
  }

  Future<Response> getRequest({required String url}) async {
    return await dio.get(url);
  }

}