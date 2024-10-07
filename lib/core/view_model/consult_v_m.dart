import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medical_consult_project/core/model/consult.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';

import '../constant/link_api.dart';

class ConsultVM {

  final HttpHelper _httpHelper = HttpHelper.instance;
  final StorgeHelper _storgeHelper =StorgeHelper.instance;

  Future<List<Consult>>fetchAllConsult()async{
    Response res = await _httpHelper.getRequest(
        url: LinkApi.linkGetConsults,
        options: Options(headers: _httpHelper.header()));

    debugPrint('Success');
    // debugPrint(res.data['consult']['title']);

    // print(_storgeHelper.readKey('token'));
    debugPrint(res.statusCode.toString());
    print(res.data['message']);
    // debugPrint(res.data['code']);
    debugPrint(res.data.hashCode.toString());
    // debugPrint(res.data['data'].toString());




    List<Map<String,dynamic>> consult = [];
    // consult.addAll(res.data['data']);
    print(res.data['data'][9].toString());
    // debugPrint('=========================');
    // debugPrint(res.data['code']);
   consult =  res.data['data'].map<Consult>((c)=>Consult.fromJson(c));
   // print(consult);
return consult.map((c)=>Consult.fromJson(res.data['data'])).toList();
//   return res.data['data'];
}
}