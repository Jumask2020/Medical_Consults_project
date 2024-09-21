class Hospital {
  int? id;
  int? idDoctor;
  String? name;
  String? location;
  String? phone;

  Hospital({this.id, this.name, this.location, this.phone});

  Hospital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    phone = json['phone'];
    idDoctor = json['idDoctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idDoctor'] = idDoctor;
    data['name'] = name;
    data['location'] = location;
    data['phone'] = phone;

    return data;
  }
}
