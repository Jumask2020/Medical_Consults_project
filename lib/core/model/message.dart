class Message {
  int? messageID;
  int? paidConsultationID;
  int? senderID;
  String? messageText;
  String? sentDateTime;
  Null messageFile;

  Message(
      {this.messageID,
      this.paidConsultationID,
      this.senderID,
      this.messageText,
      this.sentDateTime,
      this.messageFile});

  Message.fromJson(Map<String, dynamic> json) {
    messageID = json['Message_ID'];
    paidConsultationID = json['Paid_Consultation_ID'];
    senderID = json['Sender_ID'];
    messageText = json['Message_Text'];
    sentDateTime = json['Sent_DateTime'];
    messageFile = json['Message_File'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message_ID'] = messageID;
    data['Paid_Consultation_ID'] = paidConsultationID;
    data['Sender_ID'] = senderID;
    data['Message_Text'] = messageText;
    data['Sent_DateTime'] = sentDateTime;
    data['Message_File'] = messageFile;
    return data;
  }
}
