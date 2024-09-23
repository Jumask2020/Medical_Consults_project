class Message {
  int? id;
  int? idConsult;
  String? date, message, fileFacility, sender;

  Message(
      {this.id,
      this.idConsult,
      this.date,
      this.message,
      this.fileFacility,
      this.sender});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idConsult = json['idDoctor'];
    date = json['date'];
    message = json['message'];
    fileFacility = json['fileFacility'];
    sender = json['sender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['idDoctor'] = idConsult;
    data['date'] = data;
    data['message'] = message;
    data['fileFacility'] = fileFacility;
    data['sender'] = sender;

    return data;
  }
}
