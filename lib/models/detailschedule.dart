// To parse this JSON data, do
//
//     final detailSchedule = detailScheduleFromJson(jsonString);

import 'dart:convert';

DetailSchedule detailScheduleFromJson(String str) =>
    DetailSchedule.fromJson(json.decode(str));

String detailScheduleToJson(DetailSchedule data) => json.encode(data.toJson());

class DetailSchedule {
  DetailSchedule({
    this.data,
  });

  List<Datum>? data;

  factory DetailSchedule.fromJson(Map<String, dynamic> json) => DetailSchedule(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.title,
    this.day,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? title;
  String? day;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        day: json["day"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "day": day,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
