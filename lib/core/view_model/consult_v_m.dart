import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/model/consultation.dart';
import 'package:medical_consult_project/helper/http_helper.dart';

class ConsultVM {
  // final Map<String, String> _header = {
  //   'Content-Type': 'application/json',
  //   'Accept': 'application/json',
  // };
  late Consultation consultation;
  HttpHelper httpHelper = HttpHelper.instance;

  Future<Consultation> getData() async {
    Response res = await httpHelper.getRequest(
        url: LinkApi.linkGetConsultation,
        options: Options(headers: httpHelper.header()));
    debugPrint("======res=======");
    debugPrint(res.data);
    debugPrint("=============");
    debugPrint("======resData=======");
    debugPrint(res.data['data']);
    debugPrint("=============");

    consultation = Consultation.fromJson(res.data['data']);
    return consultation;
  }
}
