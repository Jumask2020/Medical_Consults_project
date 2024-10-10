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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['consultation_id'] = this.consultationId;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    data['file'] = this.file;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
