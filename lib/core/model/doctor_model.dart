class Doctor {
  int? id;
  String? name;
  String? displayMajor;

  Doctor({this.id, this.name, this.displayMajor});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayMajor = json['display_major'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['display_major'] = this.displayMajor;
    return data;
  }
}
