import 'package:medical_consult_project/core/model/hospital.dart';
import 'package:medical_consult_project/core/model/payment_account.dart';

import 'consult.dart';
import 'service.dart';
import 'working_hour.dart';

class Doctor {
  int? id;
  String? name;
  String? specialty;
  String? subSpecialty;
  String? degree;
  String? gradutionYear;
  int? experienceYear;
  String? university;
  String? image;
  List<PaymentAccount>? paymentAccounts;
  List<ServiceDoctor>? serviceDoctor;
  List<Consult>? consults;
  List<Hospital>? hospital;
  List<WorkingHour>? workingHours;
  List<String>? languages;

  Doctor(
      {this.id,
      this.name,
      this.specialty,
      this.subSpecialty,
      this.degree,
      this.gradutionYear,
      this.experienceYear,
      this.university,
      this.image,
      this.hospital,
      this.workingHours,
      this.consults,
      this.serviceDoctor,
      this.paymentAccounts,
      this.languages});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    specialty = json['specialty'];
    subSpecialty = json['sub_specialty'];
    degree = json['degree'];
    gradutionYear = json['gradution_year'];
    experienceYear = json['experience_year'];
    university = json['university'];
    image = json['image'];
    hospital = json['hospital_id'];
    workingHours = json['working_hours'];
    languages = json['languages'].cast<String>();
    consults = json['consult'];
    serviceDoctor = json['serviceDoctor'];
    paymentAccounts = json['paymentAccounts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['specialty'] = specialty;
    data['sub_specialty'] = subSpecialty;
    data['degree'] = degree;
    data['gradution_year'] = gradutionYear;
    data['experience_year'] = experienceYear;
    data['university'] = university;
    data['image'] = image;
    data['hospital_id'] = hospital;
    data['working_hours'] = workingHours;
    data['languages'] = languages;
    data['consult'] = consults;
    data['serviceDoctor'] = serviceDoctor?.map((s)=>s.toJson());
    data['paymentAccounts'] = paymentAccounts?.map((p)=>p.toJson());
    return data;
  }
}
