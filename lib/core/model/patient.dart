class Patient {
  int? id;
  String? name;
  String? phone;
  int? age;
  String? gender;

  Patient({this.id, this.name, this.phone, this.age, this.gender});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    age = json['age'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['age'] = this.age;
    data['gender'] = this.gender;
    return data;
  }
}