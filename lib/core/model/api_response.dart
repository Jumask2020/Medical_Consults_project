import 'user.dart';

class ApiResponse {
  int? code;
  String? message;
  User? user;

  ApiResponse({this.code, this.message, this.user});

  ApiResponse.fromJson(Map<String, dynamic> json) {
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
