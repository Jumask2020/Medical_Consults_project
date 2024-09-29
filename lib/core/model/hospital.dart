class Hospital {
  int? hospitalClinicID;
  int? doctorID;
  String? name;
  String? address;
  String? phone;
  String? type;

  Hospital(
      {this.hospitalClinicID,
      this.doctorID,
      this.name,
      this.address,
      this.phone,
      this.type});

  Hospital.fromJson(Map<String, dynamic> json) {
    hospitalClinicID = json['Hospital_Clinic_ID'];
    doctorID = json['Doctor_ID'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Hospital_Clinic_ID'] = hospitalClinicID;
    data['Doctor_ID'] = doctorID;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['type'] = type;
    return data;
  }
}
