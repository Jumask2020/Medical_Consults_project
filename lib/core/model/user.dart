class User {
  String? email, password, name;

  User({this.name, this.email, this.password});
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    

    return {};
  }
}
