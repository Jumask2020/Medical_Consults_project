import 'package:medical_consult_project/core/model/patient.dart';

class Consult {
  String? title;
  String? patientName;
  String? description;
  int? patientId;
  String? doctorId;
  String? status;
  String? attachedFile;
  String? age;
  String? gender;
  int? id;
  Patient? patient;

  Consult(
      {this.title,
        this.patientName,
        this.description,
        this.patientId,
        this.doctorId,
        this.status,
        this.attachedFile,
        this.age,
        this.gender,
        this.id,
      this.patient});

  Consult.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    patientName = json['patient_name'];
    description = json['description'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    status = json['status'];
    attachedFile = json['attached_file'];
    age = json['age'];
    gender = json['gender'];
    id = json['id'];
    patient = json['patient'].map((p)=>Patient.fromJson(p));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['patient_name'] = this.patientName;
    data['description'] = this.description;
    data['patient_id'] = this.patientId;
    data['doctor_id'] = this.doctorId;
    data['status'] = this.status;
    data['attached_file'] = this.attachedFile;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['patient'] = patient!.toJson();
    return data;
  }
}
