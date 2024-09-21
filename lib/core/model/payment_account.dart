class PaymentAccount {
  int? idDoctor;
  String? nameAccount;
  String? numberAccount;

  PaymentAccount({this.idDoctor, this.nameAccount, this.numberAccount});

  PaymentAccount.fromJson(Map<String, dynamic> json) {
    idDoctor = json['idDoctor'];
    nameAccount = json['name_account'];
    numberAccount = json['number_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idDoctor'] = idDoctor;
    data['name_account'] = nameAccount;
    data['number_account'] = numberAccount;
    return data;
  }
}
