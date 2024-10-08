import 'package:medical_consult_project/core/model/doctor_model.dart';

class Consultation {
  int? id;
  String? patientName;
  String? title;
  String? description;
  String? status;
  int? age;
  String? gender;
  String? attachedFile;
  Doctor? doctor;
  String? createdAt;
  String? updatedAt;

  Consultation(
      {this.id,
      this.patientName,
      this.title,
      this.description,
      this.status,
      this.age,
      this.gender,
      this.attachedFile,
      this.doctor,
      this.createdAt,
      this.updatedAt});

  Consultation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientName = json['patient_name'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    age = json['age'];
    gender = json['gender'];
    attachedFile = json['attached_file'];
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_name'] = this.patientName;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['attached_file'] = this.attachedFile;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
