class ServiceDoctor {
  int? id;
  int? idDoctor;
  String? name;

  ServiceDoctor({this.id, this.idDoctor, this.name});

  ServiceDoctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idDoctor = json['idDoctor'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idDoctor'] = idDoctor;
    data['name'] = name;
    return data;
  }
}
