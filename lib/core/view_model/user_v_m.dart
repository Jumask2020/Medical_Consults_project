import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/helper/exception_helper.dart';
import 'package:medical_consult_project/helper/http_helper.dart';

import '../model/user.dart';

class UserVM with ChangeNotifier {
  bool isAccept = false;
  final HttpHelper _httpHelper = HttpHelper.instance;
  checkAccept(val) {
    isAccept = val;
    notifyListeners();
  }

  signIn() {}
  Future<String> signUp(User user) async {
    try {
      Response res = await _httpHelper.postRequest(
          url: LinkApi.linkSignUp, data: user.toJson());
      User.fromJson(res.data);
      return 'Success';
    } on DioException catch (e) {
      return ExceptionHelper.handleException(e);
    } catch (e) {
      return '$e';
    }
  }

  forgetPassword() {}
}
