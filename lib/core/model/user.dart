class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? city;
  String? displayMajor;
  String? phone;
  String? categoryId;
  String? avatar;
  String? bio;
  String? token;
  String? role;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.passwordConfirmation,
      this.city,
      this.displayMajor,
      this.phone,
      this.categoryId,
      this.avatar,
      this.bio,
      this.token,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    passwordConfirmation = json['passwordConfirmation'];
    city = json['city'];
    displayMajor = json['display_major'];
    phone = json['phone'];
    categoryId = json['category_id'];
    avatar = json['avatar'];
    bio = json['bio'];
    token = json['token'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['passwordConfirmation'] = passwordConfirmation;
    data['city'] = city;
    data['display_major'] = displayMajor;
    data['phone'] = phone;
    data['category_id'] = categoryId;
    data['avatar'] = avatar;
    data['bio'] = bio;
    data['token'] = token;
    data['role'] = role;
    return data;
  }
}
