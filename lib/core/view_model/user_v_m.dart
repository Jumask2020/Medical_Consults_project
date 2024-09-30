import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';

import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';

import '../model/user.dart';

class UserVM with ChangeNotifier {
  bool isLoading = false;
  bool isVisible = true;

  void passwordVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }

  final HttpHelper _httpHelper = HttpHelper.instance;

  final Map<String, String> _header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };


  Future<String> signIn(User user) async {
    try {
      isLoading = true;
      notifyListeners();

      debugPrint('--------------------------1');
      Response res = await _httpHelper.postRequest(
          url: LinkApi.linkSignIn,
          data: user.toJson(),
          options: Options(headers: _header));
      debugPrint('--------------------------2');
      isLoading = false;
      notifyListeners();
      User u = User.fromJson(res.data['data']);
      debugPrint(u.email);
      saveUser(u);
      debugPrint(u.token);
      return 'Success';
    } on DioException catch (e) {
      return '$e';
    } catch (e) {
      return '$e';
    }
  }

  Future<String> signUp(User user) async {
    try {
      isLoading = true;
      notifyListeners();
      debugPrint('----------------------1');
      Response res = await _httpHelper.postRequest(
          url: LinkApi.linkSignUp,
          data: user.toJson(),
          options: Options(headers: _header));
      debugPrint('----------------------2');

      isLoading = false;
      notifyListeners();
      User u = User.fromJson(res.data['data']);
      saveUser(u);

      return 'Success';
    } on DioException catch (e) {
      return '$e';

    } catch (e) {
      return '$e';
    }
  }

  forgetPassword() {}



  saveUser(User u) {
    StorgeHelper storgeHelper = StorgeHelper.instance;
    storgeHelper.writeKey('id', u.id);
    storgeHelper.writeKey('email', u.email);
    storgeHelper.writeKey('name', u.name);
    storgeHelper.writeKey('token', u.token);

  }
}
