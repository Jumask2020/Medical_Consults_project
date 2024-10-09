import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/global/components/uploadimage.dart';
import 'package:medical_consult_project/core/model/profile.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:medical_consult_project/helper/uploadImage.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';

class ProfileVM extends ChangeNotifier {
  final HttpHelper _httpHelper = HttpHelper.instance;
  final StorgeHelper _storgeHelper = StorgeHelper.instance;
  // Profile profile = Profile();

  File? pickerFile;
  getImage(File path) {
    pickerFile = path;
    notifyListeners();
  }

  // Future uploadImageToApi(dynamic imagePath)async{
  //   return await MultipartFile.fromFile(imagePath.path,filename: imagePath.path.split('/').last);
  // }
  Map<String,dynamic> header(){
  Map<String,dynamic> header  = {
    'authorization': 'Bearer ${_storgeHelper.readKey('token')}',
    'Content-Type': 'multipart/form-data',
    'Accept': 'application/json'
  };
  return header;
}

  getDataProfile(Profile profile) async{
    // print(pickerFile!.path);
    FormData formData = FormData.fromMap({
      'phone': profile.phone,
      'city': profile.city,
      'bio': profile.bio,
      // 'category_id': profile.categoryId,
      'display_major': profile.displayMajor,
      'avatar': pickerFile!.path == ''
          ? null
          : await MultipartFile.fromFile(pickerFile!.path,
              filename: pickerFile!.path.split('/').last)
    });
    return formData;
  }

  Future<String> addProfile(Profile profile) async {
    try {
      await _httpHelper.postRequest(
          url: LinkApi.linkPostProfile,
          data: getDataProfile(profile),
          options: Options(headers: header()));
      debugPrint('Success');
      return 'Success';
    } on DioException catch (e) {
      return '$e';
    } catch (e) {
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
