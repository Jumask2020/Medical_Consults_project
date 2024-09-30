import 'user.dart';

class Profile1 {
  int? code;
  String? message;
  User? user;

  Profile1({this.code, this.message, this.user});

  Profile1.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
