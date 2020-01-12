// To parse this JSON data, do
//
//     final newModel = newModelFromJson(jsonString);

import 'dart:convert';

List<NewModel> newModelFromJson(String str) => List<NewModel>.from(json.decode(str).map((x) => NewModel.fromJson(x)));

String newModelToJson(List<NewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewModel {
  Time time;
  String description;
  String type;
  String id;
  String topic;

  NewModel({
    this.time,
    this.description,
    this.type,
    this.id,
    this.topic,
  });

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
    time: Time.fromJson(json["Time"]),
    description: json["Description"],
    type: json["Type"],
    id: json["Id"],
    topic: json["Topic"],
  );

  Map<String, dynamic> toJson() => {
    "Time": time.toJson(),
    "Description": description,
    "Type": type,
    "Id": id,
    "Topic": topic,
  };
}

class Time {
  int seconds;
  int nanoseconds;

  Time({
    this.seconds,
    this.nanoseconds,
  });

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    seconds: json["_seconds"],
    nanoseconds: json["_nanoseconds"],
  );

  Map<String, dynamic> toJson() => {
    "_seconds": seconds,
    "_nanoseconds": nanoseconds,
  };
}
