class Profile {
  int? id;
  String? name;
  String? email;
  String? city;
  String? displayMajor;
  String? phone;
  int? categoryId;
  String? avatar;
  String? bio;

  Profile(
      {this.id,
        this.name,
        this.email,
        this.city,
        this.displayMajor,
        this.phone,
        this.categoryId,
        this.avatar,
        this.bio});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    city = json['city'];
    displayMajor = json['display_major'];
    phone = json['phone'];
    categoryId = json['category_id'];
    avatar = json['avatar'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['city'] = this.city;
    data['display_major'] = this.displayMajor;
    data['phone'] = this.phone;
    data['category_id'] = this.categoryId;
    data['avatar'] = this.avatar;
    data['bio'] = this.bio;
    return data;
  }
}
