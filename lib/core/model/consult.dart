import 'package:medical_consult_project/core/model/message.dart';
import 'package:medical_consult_project/core/model/payment_process.dart';

class Consult {
  int? id;
  int? idDoctor;
  int? idPatient;
  String? date;
  String? desSickness;
  String? diagnosis;
  String? address;
  String? fileFacility;
  PaymentProcess? paymentProcess;
  StateConsult? stateConsult;
  List<Message>? message;

  Consult(
      {this.id,
      this.idDoctor,
      this.idPatient,
      this.date,
      this.diagnosis,
      this.address,
      this.fileFacility,
      this.stateConsult,
      this.message,
      this.paymentProcess,
      this.desSickness});

  Consult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idDoctor = json['id_doctor'];
    idPatient = json['id_patient'];
    date = json['date'];
    diagnosis = json['diagnosis'];
    address = json['address'];
    fileFacility = json['file_facility'];
    stateConsult = json['state_consult'];
    desSickness = json['desSickness'];
    message = json['message'];
    paymentProcess = json['paymentProcess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_doctor'] = idDoctor;
    data['id_patient'] = idPatient;
    data['date'] = date;
    data['diagnosis'] = diagnosis;
    data['address'] = address;
    data['file_facility'] = fileFacility;
    data['state_consult'] = stateConsult;
    data['message'] = message;
    data['paymentProcess'] = paymentProcess;
    return data;
  }
}

enum StateConsult { opened, closed, waiting }
