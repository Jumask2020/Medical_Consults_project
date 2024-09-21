class PaymentProcess {
  int? idPayment;
  int? idConsult;
  String? numberSituation;
  String? bondImage;

  PaymentProcess(
      {this.idPayment, this.idConsult, this.numberSituation, this.bondImage});

  PaymentProcess.fromJson(Map<String, dynamic> json) {
    idPayment = json['id_payment'];
    idConsult = json['idConsult'];
    numberSituation = json['number_situation'];
    bondImage = json['bond_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_payment'] = idPayment;
    data['idConsult'] = idConsult;
    data['number_situation'] = numberSituation;
    data['bond_image'] = bondImage;
    return data;
  }
}
