class Patient {
  int? patientID;
  int? userID;
  String? dateOfBirth;
  int? weight;
  int? height;
  String? medicalHistory;

  Patient(
      {this.patientID,
      this.userID,
      this.dateOfBirth,
      this.weight,
      this.height,
      this.medicalHistory});

  Patient.fromJson(Map<String, dynamic> json) {
    patientID = json['Patient_ID'];
    userID = json['User_ID'];
    dateOfBirth = json['Date_of_Birth'];
    weight = json['weight'];
    height = json['height'];
    medicalHistory = json['Medical_history'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Patient_ID'] = patientID;
    data['User_ID'] = userID;
    data['Date_of_Birth'] = dateOfBirth;
    data['weight'] = weight;
    data['height'] = height;
    data['Medical_history'] = medicalHistory;
    return data;
  }
}
