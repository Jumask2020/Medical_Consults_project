import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/global/components/uploadimage.dart';
import 'package:medical_consult_project/core/model/categry.dart';
import 'package:medical_consult_project/core/model/profile.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:medical_consult_project/helper/uploadImage.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';

class ProfileVM extends ChangeNotifier {
  final HttpHelper _httpHelper = HttpHelper.instance;
  final StorgeHelper _storgeHelper = StorgeHelper.instance;
  // Profile profile = Profile();
  String? doctorName;

  File? pickerFile;
  getImage(File path) {
    pickerFile = path;
    notifyListeners();
  }

  selectedSpec() {
    notifyListeners();
  }

  ProfileVM() {
    // getAllCategries();
    fetchProfile();
  }
  List<String> nameSpac=[
    "مخ واعصاب",
    "مخ واعصاب",
    "مخ واعصاب",
    "مخ واعصاب",
  ];
  // getNameSpacification(){
  //   specializationOptions!.forEach((element) {
  //       nameSpac.add(element.name!);
  //   },);
  // }

  List<Categry>? specializationOptions = [];
  getAllCategries() async {
    try {
      Response res = await _httpHelper.getRequest(
          url: LinkApi.linkGetCategories,
          options: Options(headers: _httpHelper.header()));
      specializationOptions =
          res.data['data'][''].map<Categry>((c) => Categry.fromJson(c)).toList();
    } on DioException catch (e) {

    } catch (e) {}
  }

  Future<String> addProfile(Profile profile, {File? filePath}) async {
    try {
      Response res = await _httpHelper.postRequest(
          url: LinkApi.linkPostProfile,
          data: FormData.fromMap(
            {
              'phone': profile.phone,
              'city': profile.city,
              'bio': profile.bio,
              'display_major': profile.displayMajor,
              // 'category_id':profile.categoryId,
              // 'avatar': await MultipartFile.fromFile(filePath!.path,
              // filename: filePath.path.split('/').last)
            },
          ),

          // data:   profile.toJson(),
          options: Options(
              headers: _httpHelper.header(type: 'multipart/form-data')));
      print(res.data['user']);
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
        options:
            Options(headers: _httpHelper.header(type: 'multipart/form-data')));
    debugPrint('Success');
    Profile profile = Profile.fromJson(res.data['user']);
    doctorName = profile.name;
    debugPrint('=========================');

    return profile;
  }
}
