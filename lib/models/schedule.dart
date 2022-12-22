// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Schedule({
    this.data,
  });

  Data? data;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
  });

  int? monday;
  int? tuesday;
  int? wednesday;
  int? thursday;
  int? friday;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        monday: json["monday"],
        tuesday: json["tuesday"],
        wednesday: json["wednesday"],
        thursday: json["thursday"],
        friday: json["friday"],
      );

  Map<String, dynamic> toJson() => {
        "monday": monday,
        "tuesday": tuesday,
        "wednesday": wednesday,
        "thursday": thursday,
        "friday": friday,
      };
}
