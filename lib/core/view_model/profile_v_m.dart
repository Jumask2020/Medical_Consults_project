import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/model/api_response.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';

class ProfileVM {
  HttpHelper _httpHelper = HttpHelper.instance;
  StorgeHelper _storgeHelper = StorgeHelper.instance;

  Future<String> addProfile(Profile profile) async {
    String token = _storgeHelper.readKey('token');
    debugPrint(token);
    final Map<String, String> _header = {
      'authorization': 'Bearer ${token}',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    try {
      Response res = await _httpHelper.postRequest(
          url: LinkApi.linkPostProfile,
          data: profile.toJson(),
          options: Options(headers: _header));
      debugPrint('Success');
      return 'تم أكمال الملف الشخصي بنجاح';
    }on DioException catch(e){
      return '$e';
    }catch (e){
      return '$e';
    }
  }
}
