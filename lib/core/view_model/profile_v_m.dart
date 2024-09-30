import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/model/profile.dart';
import 'package:medical_consult_project/helper/http_helper.dart';


class ProfileVM {
  final HttpHelper _httpHelper = HttpHelper.instance;
  Future<String> addProfile(Profile profile) async {

    try {
      await _httpHelper.postRequest(
          url: LinkApi.linkPostProfile,
          data: profile.toJson(),
          options: Options(headers: _httpHelper.header()));
      debugPrint('Success');
      return 'تم أكمال الملف الشخصي بنجاح';
    }on DioException catch(e){
      return '$e';
    }catch (e){
      return '$e';
    }
  }

  Future<Object> fetchProfile(Profile profile) async {
    try {
      Response res = await _httpHelper.getRequest(
          url: LinkApi.linkPostProfile,
          options: Options(headers: _httpHelper.header()));
      debugPrint('Success');
      Profile profile = Profile.fromJson(res.data['data']);
      return profile;
    }on DioException catch(e){
      return '$e';
    }catch (e){
      return '$e';
    }
  }
}
