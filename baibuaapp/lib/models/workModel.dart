// To parse this JSON data, do
//
//     final workModel = workModelFromJson(jsonString);

import 'dart:convert';

WorkModel workModelFromJson(String str) => WorkModel.fromJson(json.decode(str));

String workModelToJson(WorkModel data) => json.encode(data.toJson());

class WorkModel {
  String topic;
  String description;
  String group;
  String createDay;
  String createMonth;
  String createYear;
  String sendDay;
  String sendMonth;
  String sendYear;

  WorkModel({
    this.topic,
    this.description,
    this.group,
    this.createDay,
    this.createMonth,
    this.createYear,
    this.sendDay,
    this.sendMonth,
    this.sendYear,
  });

  factory WorkModel.fromJson(Map<String, dynamic> json) => WorkModel(
        topic: json["Topic"],
        description: json["Description"],
        group: json["Group"],
        createDay: json["CreateDay"],
        createMonth: json["CreateMonth"],
        createYear: json["CreateYear"],
        sendDay: json["SendDay"],
        sendMonth: json["SendMonth"],
        sendYear: json["SendYear"],
      );

  Map<String, dynamic> toJson() => {
        "Topic": topic,
        "Description": description,
        "Group": group,
        "CreateDay": createDay,
        "CreateMonth": createMonth,
        "CreateYear": createYear,
        "SendDay": sendDay,
        "SendMonth": sendMonth,
        "SendYear": sendYear,
      };
}
