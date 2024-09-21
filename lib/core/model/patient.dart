import 'package:medical_consult_project/core/model/consult.dart';

class Patient {
  int? id;
  String? name;
  int? age;
  String? sex;
  String? phone;
  String? phoneWatsapp;
  String? address;
  List<Consult>? consultPatient;

  Patient(
      {this.id,
      this.name,
      this.age,
      this.sex,
      this.phone,
      this.phoneWatsapp,
      this.address,
      this.consultPatient});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    sex = json['sex'];
    phone = json['phone'];
    phoneWatsapp = json['phone_watsapp'];
    address = json['address'];
    consultPatient = json['consultPatient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['sex'] = sex;
    data['phone'] = phone;
    data['phone_watsapp'] = phoneWatsapp;
    data['address'] = address;
    return data;
  }
}
