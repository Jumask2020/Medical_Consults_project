class WorkingHour {
  Days? day;
  int? idDoctor;
  String? toTime;
  String? fromTime;

  WorkingHour({this.day, this.fromTime, this.toTime, this.idDoctor});

  WorkingHour.formJson(Map<String, dynamic> json) {
    day = json['day'];
    idDoctor = json['idDoctor'];
    toTime = json['toTime'];
    fromTime = json['fromTime'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['day'] = day;
    data['toTime'] = toTime;
    data['fromTime'] = fromTime;
    return data;
  }
}

enum Days { saturday, sunday, monday, tuesday, wednesday, thursday, friday }
