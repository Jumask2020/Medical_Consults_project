import 'package:dio/dio.dart';
import 'package:medical_consult_project/core/model/user.dart';
import 'package:medical_consult_project/core/constant/http_urls.dart';
import 'package:medical_consult_project/helper/http_helper.dart';

class ProfileVm{



  Dio dio= Dio();



  Future<User> getProfileInfo() async {
    User user =User();
    HttpHelper httpHelper=HttpHelper.instsnse;
    Response res= await httpHelper.getRequest(url: HttpUrls.profile);
   // Map<String,dynamic> doctorInfo =res.data['user'].map((elemnt)=>User.fromJson(elemnt)).toList();
    print("1THE VALUE IN OBJECT 1::::$user");
    print("*0*2THE VALUE IN RES DATA*0*::::${res.data}");
   user=res.data['user'].map<User>((elemnt)=>User.fromJson(elemnt));
    print("2THE VALUE IN OBJECT 2::::$user");
    print("*02*2THE VALUE IN RES DATA*02*::::${res.data}");


    return user;
  }
}