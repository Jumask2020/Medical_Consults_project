import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/model/replay.dart';
import 'package:medical_consult_project/helper/http_helper.dart';

class repalyVM {
  HttpHelper httpHelper = HttpHelper.instance;
  Replay replay = Replay();

  postRequest() async {
    try {
      httpHelper.postRequest(
          url: LinkApi.linkGetReplaies,
          data: replay.toJson(),
          options: Options(headers: httpHelper.header()));
      debugPrint('Success');
      return 'Success';
    } on DioException catch (e) {
      return '$e';
    } catch (e) {
      return '$e';
    }
  }
}
