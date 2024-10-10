class Replay {
  String? consultationId;
  int? userId;
  String? message;
  String? file;
  int? id;

  Replay({this.consultationId, this.userId, this.message, this.file, this.id});

  Replay.fromJson(Map<String, dynamic> json) {
    consultationId = json['consultation_id'];
    userId = json['user_id'];
    message = json['message'];
    file = json['file'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consultation_id'] = this.consultationId;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    data['file'] = this.file;
    data['id'] = this.id;
    return data;
  }

  Map<String, dynamic> MessagetoJson() {
    final Map<String, dynamic> messageData = new Map<String, dynamic>();
    messageData['message'] = this.message;
    return messageData;
  }
}
