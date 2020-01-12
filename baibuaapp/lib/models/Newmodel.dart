// To parse this JSON data, do
//
//     final newModel = newModelFromJson(jsonString);

import 'dart:convert';

//List<NewModel> newModelFromJson(String str) => List<NewModel>.from(json.decode(str).map((x) => NewModel.fromJson(x)));
//
//String newModelToJson(List<NewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewModel {
  String description;
  String type;
  String id;
  String year;
  String month;
  int status;
  String day;
  String topic;

  NewModel({
    this.description,
    this.type,
    this.id,
    this.year,
    this.month,
    this.status,
    this.day,
    this.topic,
  });

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
    description: json["Description"],
    type: json["Type"],
    id: json["Id"],
    year: json["Year"],
    month: json["Month"],
    status: json["Status"],
    day: json["Day"],
    topic: json["Topic"],
  );

  Map<String, dynamic> toJson() => {
    "Description": description,
    "Type": type,
    "Id": id,
    "Year": year,
    "Month": month,
    "Status": status,
    "Day": day,
    "Topic": topic,
  };
}
