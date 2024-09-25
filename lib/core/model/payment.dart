class Payment {
  int? paymentID;
  int? paidConsultationID;
  int? amount;
  String? paymentMethod;
  String? paymentDateTime;
  String? paymentStatus;
  String? paymentImage;
  String? transactionID;

  Payment(
      {this.paymentID,
      this.paidConsultationID,
      this.amount,
      this.paymentMethod,
      this.paymentDateTime,
      this.paymentStatus,
      this.paymentImage,
      this.transactionID});

  Payment.fromJson(Map<String, dynamic> json) {
    paymentID = json['Payment_ID'];
    paidConsultationID = json['Paid_Consultation_ID'];
    amount = json['Amount'];
    paymentMethod = json['Payment_Method'];
    paymentDateTime = json['Payment_DateTime'];
    paymentStatus = json['Payment_Status'];
    paymentImage = json['Payment_image'];
    transactionID = json['Transaction_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Payment_ID'] = paymentID;
    data['Paid_Consultation_ID'] = paidConsultationID;
    data['Amount'] = amount;
    data['Payment_Method'] = paymentMethod;
    data['Payment_DateTime'] = paymentDateTime;
    data['Payment_Status'] = paymentStatus;
    data['Payment_image'] = paymentImage;
    data['Transaction_ID'] = transactionID;
    return data;
  }
}
