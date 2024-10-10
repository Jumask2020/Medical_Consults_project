import 'package:medical_consult_project/core/model/user.dart';

class Replay {
  int? id;
  int? consultationId;
  int? userId;
  String? message;
  String? file;
  String? createdAt;
  String? updatedAt;
  User? user;

  Replay(
      {this.id,
      this.consultationId,
      this.userId,
      this.message,
      this.file,
      this.createdAt,
      this.updatedAt,
      this.user});

  Replay.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    userId = json['user_id'];
    message = json['message'];
    file = json['file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_id'] = consultationId;
    data['user_id'] = userId;
    data['message'] = message;
    data['file'] = file;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
