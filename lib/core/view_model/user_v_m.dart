import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/helper/exception_helper.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';

import '../model/user.dart';

class UserVM with ChangeNotifier {
  bool isLoading = false;
  final HttpHelper _httpHelper = HttpHelper.instance;
  // checkAccept(val) {
  //   isAccept = val;
  //   notifyListeners();
  // }

  Future<String> signIn(User user) async {
    try {
      isLoading = true;
      notifyListeners();
      Response res = await _httpHelper.postRequest(
          url: LinkApi.linkSignIn,
          data: user.toJson(),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }));
      isLoading = false;
      notifyListeners();
      debugPrint(user.toJson().toString());
      User u = User.fromJson(res.data['user']);
      saveUser(u);
      return 'Success';
    } on DioException catch (e) {
      // print(e.response!.statusCode);
      return ExceptionHelper.handleException(e);
    } catch (e) {
      return '$e';
    }
  }

  Future<String> signUp(User user) async {
    try {
      isLoading = true;
      notifyListeners();
      debugPrint(user.toJson().toString());
      Response res = await _httpHelper.postRequest(
          url: LinkApi.linkSignUp,
          data: user.toJson(),
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }));
      isLoading = false;
      notifyListeners();
      debugPrint(user.toJson().toString());

      return 'Success';
    } on DioException catch (e) {
      
      return ExceptionHelper.handleException(e);
    } catch (e) {
      return '$e';
    }
  }

  forgetPassword() {}

  // handleByCodeState(int codeState) {
  //   switch (codeState) {
  //     case 200:
  //       return 'Login successful';
  //     case 422:
  //       return 'The email has already been taken';
  //     case 401:
  //       return 'Invalid login credentials';
  //   }
  // }

  saveUser(User u) {
    StorgeHelper storgeHelper = StorgeHelper.instance;
    storgeHelper.writeKey('id', u.id);
    storgeHelper.writeKey('email', u.email);
    storgeHelper.writeKey('name', u.name);
  }
}
