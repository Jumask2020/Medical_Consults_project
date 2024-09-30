import 'package:medical_consult_project/core/model/profile.dart';

import 'user.dart';

class Profile {
  int? code;
  String? message;
  User? user;

  Profile({this.code, this.message, this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}