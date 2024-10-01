class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? token;
  String? role;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.passwordConfirmation,
      this.token,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
    token = json['token'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    data['token'] = token;
    data['role'] = role;
    return data;
  }
}
