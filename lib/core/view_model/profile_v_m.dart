import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/model/profile.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';


class ProfileVM {
  final HttpHelper _httpHelper = HttpHelper.instance;
  Future<String> addProfile(Profile profile) async {

    try {
      await _httpHelper.postRequest(
          url: LinkApi.linkPostProfile,
          data: profile.toJson(),
          options: Options(headers: _httpHelper.header()));
      debugPrint('Success');
      return 'Success';
    }on DioException catch(e){
      return '$e';
    }catch (e){
      return '$e';
    }
  }

  Future<Profile> fetchProfile() async {
    StorgeHelper storgeHelper = StorgeHelper.instance;
    print(storgeHelper.readKey('token'));
    print(storgeHelper.readKey('id'));

      Response res = await _httpHelper.getRequest(
          url: LinkApi.linkGetProfile,
          options: Options(headers: _httpHelper.header()));
      debugPrint('Success');
      Profile profile = Profile.fromJson(res.data['user']);
    debugPrint('=========================');

      return profile;

  }
}
