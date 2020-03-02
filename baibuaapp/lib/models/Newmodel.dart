// To parse this JSON data, do
//
//     final newModel = newModelFromJson(jsonString);

import 'dart:convert';

List<NewModel> newModelFromJson(String str) =>
    List<NewModel>.from(json.decode(str).map((x) => NewModel.fromJson(x)));

String newModelToJson(List<NewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewModel {
  List<String> date;
  int status;
  String topic;
  String description;
  String type;
  String id;
  String time;

  NewModel({
    this.date,
    this.status,
    this.topic,
    this.description,
    this.type,
    this.id,
    this.time,
  });

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
        date: List<String>.from(json["Date"].map((x) => x)),
        status: json["Status"],
        topic: json["Topic"],
        description: json["Description"],
        type: json["Type"],
        id: json["Id"],
        time: json["Time"] == null ? null : json["Time"],
      );

  Map<String, dynamic> toJson() => {
        "Date": List<dynamic>.from(date.map((x) => x)),
        "Status": status,
        "Topic": topic,
        "Description": description,
        "Type": type,
        "Id": id,
        "Time": time == null ? null : time,
      };
}
