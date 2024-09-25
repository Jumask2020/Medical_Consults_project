class Doctor {
  int? doctorID;
  int? userID;
  String? specialization;
  String? degree;
  String? university;
  int? graduationYear;
  String? image;
  String? nationality;
  int? experience;

  Doctor(
      {this.doctorID,
      this.userID,
      this.specialization,
      this.degree,
      this.university,
      this.graduationYear,
      this.image,
      this.nationality,
      this.experience});

  Doctor.fromJson(Map<String, dynamic> json) {
    doctorID = json['Doctor_ID'];
    userID = json['User_ID'];
    specialization = json['Specialization'];
    degree = json['degree'];
    university = json['university'];
    graduationYear = json['graduation_year'];
    image = json['image'];
    nationality = json['nationality'];
    experience = json['experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Doctor_ID'] = doctorID;
    data['User_ID'] = userID;
    data['Specialization'] = specialization;
    data['degree'] = degree;
    data['university'] = university;
    data['graduation_year'] = graduationYear;
    data['image'] = image;
    data['nationality'] = nationality;
    data['experience'] = experience;
    return data;
  }
}
