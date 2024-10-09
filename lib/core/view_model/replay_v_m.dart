import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/model/replay.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:flutter/foundation.dart';

class ReplayVM extends ChangeNotifier {
  HttpHelper httpHelper = HttpHelper.instance;
  Replay replay = Replay();
  String? requestMessage;
  int count = 1;

  Future<String?> postRequest() async {
    try {
      httpHelper.postRequest(
          url: LinkApi.linkGetReplaies,
          data: replay.toJson(),
          options: Options(headers: httpHelper.header()));
      debugPrint('Success');
      debugPrint('1|THE MESSAGE${requestMessage}');

      //return 'Success';
      return replay.message;
    } on DioException catch (e) {
      return '$e';
    } catch (e) {
      return '$e';
    }
  }

  String? changeMessage(String message) {
    requestMessage = message;
    debugPrint('2|THE MESSAGE${requestMessage}');
    notifyListeners();
    return requestMessage;
  }
}
