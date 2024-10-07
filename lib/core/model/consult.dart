import 'patient.dart';

class Consult {
  int? id;
  String? title;
  String? description;
  String? status;
  int? age;
  String? gender;
  String? files;
  Patient? patient;

  Consult(
      {this.id,
        this.title,
        this.description,
        this.status,
        this.age,
        this.gender,
        this.files,
        this.patient});

  Consult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    age = json['age'];
    gender = json['gender'];
    files = json['files'];
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['files'] = this.files;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    return data;
  }
}