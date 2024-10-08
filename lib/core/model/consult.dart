import 'patient.dart';

class Consult {
  int? id;
  String? title;
  String? description;
  String? status;
  int? age;
  String? gender;
  String? attachedFile;
  Patient? patient;
  String? createdAt;
  String? updatedAt;

  Consult(
      {this.id,
        this.title,
        this.description,
        this.status,
        this.age,
        this.gender,
        this.attachedFile,
        this.patient,
        this.createdAt,
        this.updatedAt});

  Consult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    age = json['age'];
    gender = json['gender'];
    attachedFile = json['attached_file'];
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['attached_file'] = this.attachedFile;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


