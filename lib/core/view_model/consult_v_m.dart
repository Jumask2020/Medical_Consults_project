import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:medical_consult_project/core/model/consult.dart';
import 'package:medical_consult_project/helper/exception_helper.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';

import '../constant/link_api.dart';

class ConsultVM {
  final HttpHelper _httpHelper = HttpHelper.instance;

  Future<List<Consult>?> fetchAllConsult() async {
    try {
      Response res = await _httpHelper.getRequest(
          url: LinkApi.linkGetConsults,
          options: Options(headers: _httpHelper.header()));
      List<dynamic> data = res.data['data'];
      List<Consult> consults =
          data.map<Consult>((c) => Consult.fromJson(c)).toList();
      return consults;
    } on DioException catch (e) {
      return ExceptionHelper.handleExceptionArabic(e);
    }
  }

  Future<List<Consult>?> fetchConsultByID() async {
    try {
      Response res = await _httpHelper.getRequest(
          url: LinkApi.linkGetConsults,
          options: Options(headers: _httpHelper.header()));
      List<dynamic> data = res.data['data'];
      List<Consult> consults =
          data.map<Consult>((c) => Consult.fromJson(c)).toList();
      return consults;
    } on DioException catch (e) {
      return ExceptionHelper.handleExceptionArabic(e);
    }
  }
}
