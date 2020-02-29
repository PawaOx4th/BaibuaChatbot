// To parse this JSON data, do
//
//     final workofCountModel = workofCountModelFromJson(jsonString);

import 'dart:convert';

List<WorkofCountModel> workofCountModelFromJson(String str) =>
    List<WorkofCountModel>.from(
        json.decode(str).map((x) => WorkofCountModel.fromJson(x)));

String workofCountModelToJson(List<WorkofCountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkofCountModel {
  List<String> updateDate;
  String id;
  String topic;
  String description;
  String group;
  List<String> createDate;
  List<String> sendDate;

  WorkofCountModel({
    this.updateDate,
    this.id,
    this.topic,
    this.description,
    this.group,
    this.createDate,
    this.sendDate,
  });

  factory WorkofCountModel.fromJson(Map<String, dynamic> json) =>
      WorkofCountModel(
        updateDate: List<String>.from(json["UpdateDate"].map((x) => x)),
        id: json["Id"],
        topic: json["Topic"],
        description: json["Description"],
        group: json["Group"],
        createDate: List<String>.from(json["CreateDate"].map((x) => x)),
        sendDate: List<String>.from(json["SendDate"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "UpdateDate": List<dynamic>.from(updateDate.map((x) => x)),
        "Id": id,
        "Topic": topic,
        "Description": description,
        "Group": group,
        "CreateDate": List<dynamic>.from(createDate.map((x) => x)),
        "SendDate": List<dynamic>.from(sendDate.map((x) => x)),
      };
}
