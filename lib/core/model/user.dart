class User {
  int? userID;
  String? name;
  String? email;
  String? password;
  String? userType;
  String? phone;
  String? address;
  String? registrationDate;

  User(
      {this.userID,
      this.name,
      this.email,
      this.password,
      this.userType,
      this.phone,
      this.address,
      this.registrationDate});

  User.fromJson(Map<String, dynamic> json) {
    userID = json['User_ID'];
    name = json['name'];
    email = json['Email'];
    password = json['Password'];
    userType = json['User_type'];
    phone = json['phone'];
    address = json['address'];
    registrationDate = json['Registration_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['User_ID'] = userID;
    data['name'] = name;
    data['Email'] = email;
    data['Password'] = password;
    data['User_type'] = userType;
    data['phone'] = phone;
    data['address'] = address;
    data['Registration_date'] = registrationDate;
    return data;
  }
}
