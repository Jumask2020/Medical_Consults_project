class Consult {
  int? paidConsultationID;
  int? doctorID;
  int? patientID;
  String? description;
  String? file;
  String? consultState;

  Consult(
      {this.paidConsultationID,
      this.doctorID,
      this.patientID,
      this.description,
      this.file,
      this.consultState});

  Consult.fromJson(Map<String, dynamic> json) {
    paidConsultationID = json['Paid_Consultation_ID'];
    doctorID = json['Doctor_ID'];
    patientID = json['Patient_ID'];
    description = json['description'];
    file = json['File'];
    consultState = json['Consult_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Paid_Consultation_ID'] = paidConsultationID;
    data['Doctor_ID'] = doctorID;
    data['Patient_ID'] = patientID;
    data['description'] = description;
    data['File'] = file;
    data['Consult_state'] = consultState;
    return data;
  }
}
