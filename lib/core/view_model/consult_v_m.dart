import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:medical_consult_project/core/model/consult.dart';
import 'package:medical_consult_project/helper/exception_helper.dart';
import 'package:medical_consult_project/helper/http_helper.dart';
import 'package:medical_consult_project/helper/storge_helper.dart';

import '../constant/link_api.dart';

class ConsultVM extends ChangeNotifier {
  final HttpHelper _httpHelper = HttpHelper.instance;
  List<Consult>? complete;
  List<Consult>? waiting_patient;
  List<Consult>? waiting_doctor;
  List<Consult>? reject;
  bool isSelected = false;
  // int? noComplet;
  ConsultVM() {
    // fetchAllConsult();
  }
  Future<List<Consult>?> fetchAllConsult() async {
    try {
      Response res = await _httpHelper.getRequest(
          url: LinkApi.linkGetConsults,
          options: Options(headers: _httpHelper.header()));
      List<dynamic> data = res.data['data'];
      List<Consult> consults =
          data.map<Consult>((c) => Consult.fromJson(c)).toList();
      // List<int> comp = res.data['data']['status'];
      complete = consults.where((c) => c.status == 'complete').toList();
      print("+===============================");
      print(complete);
      print(complete!.length);
      // noComplet = complete!.length;
      waiting_patient =
          consults.where((c) => c.status == 'waiting_patient').toList();

      waiting_doctor =
          consults.where((c) => c.status == 'waiting_doctor').toList();
      reject = consults.where((c) => c.status == 'reject').toList();
      print("%%%%%%%%%%%####################");
      print(consults);
      print(consults.length);
      isSelected = !isSelected;
      notifyListeners();
      return consults;
    } on DioException catch (e) {
      return ExceptionHelper.handleExceptionArabic(e);
    }
  }

  int getCompleteCount() {
    return complete?.length ?? 0;
  }

  int getWaitingPatientCount() {
    return waiting_patient?.length ?? 0;
  }

  int getWaitingDoctorCount() {
    return waiting_doctor?.length ?? 0;
  }

  int getRejectCount() {
    return reject?.length ?? 0;
  }

  Future<String> closeConsult(int? id) async {
    try {
      Response res = await _httpHelper.postRequest(
          url: LinkApi.linkCloseConsults,
          data: {'id': id, 'status': 'completed'},
          options: Options(headers: _httpHelper.header()));
      isSelected = !isSelected;
      notifyListeners();
      return "success";
    } on DioException catch (e) {
      return ExceptionHelper.handleExceptionArabic(e);
    } catch (e) {
      return "$e";
    }
  }

  // Future<List<Consult>?> fetchConsultByID() async {
  //   try {
  //     Response res = await _httpHelper.getRequest(
  //         url: LinkApi.linkGetConsults,
  //         options: Options(headers: _httpHelper.header()));
  //     List<dynamic> data = res.data['data'];
  //     List<Consult> consults =
  //         data.map<Consult>((c) => Consult.fromJson(c)).toList();
  //     return consults;
  //   } on DioException catch (e) {
  //     return ExceptionHelper.handleExceptionArabic(e);
  //   }
  // }
}
