class WorkingHour {
  int? workingHourID;
  int? doctorID;
  String? day;
  String? startTime;
  String? endTime;

  WorkingHour(
      {this.workingHourID,
      this.doctorID,
      this.day,
      this.startTime,
      this.endTime});

  WorkingHour.fromJson(Map<String, dynamic> json) {
    workingHourID = json['Working_Hour_ID'];
    doctorID = json['Doctor_ID'];
    day = json['Day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Working_Hour_ID'] = workingHourID;
    data['Doctor_ID'] = doctorID;
    data['Day'] = day;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}
