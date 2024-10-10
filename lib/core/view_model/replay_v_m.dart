import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medical_consult_project/core/constant/link_api.dart';
import 'package:medical_consult_project/core/model/replay.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:flutter/foundation.dart';

class ReplayVM extends ChangeNotifier {
  HttpHelper httpHelper = HttpHelper.instance;
  String? requestMessage;

  final StreamController<List<Replay>?> _controllerUser =
  StreamController<List<Replay>>.broadcast();

  sendMessage(){
    notifyListeners();
  }


  Future<List<Replay>?> getReplies(String id)async{
    try {
      Response res = await httpHelper.getRequest(
          url: LinkApi().linkGetReplaies(id),
          options: Options(headers: httpHelper.header()));
      print(res.data['data']['replies'].toString());
      return res.data['data']['replies'].map<Replay>((r)=>Replay.fromJson(r)).toList();

    } on DioException catch (e) {
      // return '$e';
    } catch (e) {
      // return '$e';
    }
  }

  Future<String?> addReply({String? message,required String id ,File? filePath,}) async {
    try {
      Response res = await httpHelper.postRequest(
          url: LinkApi().linkGetReplaies(id),
          data: FormData.fromMap({
            'message':message,
            'file':await MultipartFile.fromFile(filePath!.path,filename: 'https://cons.actnow-ye.com/uploads/replies/${filePath.path.split("/").last}')
          }),
          options: Options(headers: httpHelper.header(type: 'multipart/form-data')));
      print(filePath);
      return message;
    } on DioException catch (e) {
      return '$e';
    } catch (e) {
      return '$e';
    }
  }

}