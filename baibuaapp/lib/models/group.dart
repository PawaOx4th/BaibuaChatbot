// To parse this JSON data, do
//
//     final group = groupFromJson(jsonString);

import 'dart:convert';

List<Group> groupFromJson(String str) =>
    List<Group>.from(json.decode(str).map((x) => Group.fromJson(x)));

String groupToJson(List<Group> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Group {
  String id;
  Sec sec;

  Group({
    this.id,
    this.sec,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["Id"],
        sec: Sec.fromJson(json["Sec"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Sec": sec.toJson(),
      };
}

class Sec {
  List<String> updateDate;
  List<String> studyTime;
  String id;
  String subject;
  int status;
  int sec;
  List<String> createDate;

  Sec({
    this.updateDate,
    this.studyTime,
    this.id,
    this.subject,
    this.status,
    this.sec,
    this.createDate,
  });

  factory Sec.fromJson(Map<String, dynamic> json) => Sec(
        updateDate: List<String>.from(json["UpdateDate"].map((x) => x)),
        studyTime: List<String>.from(json["StudyTime"].map((x) => x)),
        id: json["Id"],
        subject: json["Subject"],
        status: json["Status"],
        sec: json["Sec"],
        createDate: List<String>.from(json["CreateDate"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "UpdateDate": List<dynamic>.from(updateDate.map((x) => x)),
        "StudyTime": List<dynamic>.from(studyTime.map((x) => x)),
        "Id": id,
        "Subject": subject,
        "Status": status,
        "Sec": sec,
        "CreateDate": List<dynamic>.from(createDate.map((x) => x)),
      };
}
