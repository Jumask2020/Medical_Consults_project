class Categry {
  int? id;
  String? name;
  String? image;
  int? isActive;


  Categry(
      {this.id,
        this.name,
        this.image,
        this.isActive,
        });

  Categry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['isActive'] = this.isActive;

    return data;
  }
}
