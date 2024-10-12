import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/model/replay.dart';
import 'package:medical_consult_project/helper/exception_helper.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:flutter/foundation.dart';

class ReplayVM extends ChangeNotifier {
  HttpHelper httpHelper = HttpHelper.instance;
  String? requestMessage;

  sendMessage() {
    notifyListeners();
  }

  Future<List<Replay>?> getReplies(String id) async {
    try {
      Response res = await httpHelper.getRequest(
          url: LinkApi().linkGetReplaies(id),
          options: Options(headers: httpHelper.header()));
      print(res.data['data']['replies'].toString());
      return res.data['data']['replies']
          .map<Replay>((r) => Replay.fromJson(r))
          .toList();
    } on DioException catch (e) {
      return ExceptionHelper.handleExceptionArabic(e);
    } catch (e) {
      // return '$e';
    }
  }

  ReplayVM();
  Future<String?> addReply({
    String? message,
    required String id,
    File? filePath,
  }) async {
    try {
      Response res = await httpHelper.postRequest(
          url: LinkApi().linkGetReplaies(id),
          data: filePath != null
              ? FormData.fromMap({
                  'message': message,
                  'file': await MultipartFile.fromFile(filePath.path,
                      filename:
                          filePath.path.split("/").last)
                })
              : {
                  'message': message,
                },
          options: Options(
              headers: filePath != null
                  ? httpHelper.header(type: 'multipart/form-data')
                  : httpHelper.header()));
      print(filePath);
      return message;
    } on DioException catch (e) {
      return '$e';
    } catch (e) {
      return '$e';
    }
  }
}
