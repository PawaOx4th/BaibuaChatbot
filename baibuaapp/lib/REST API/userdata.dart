// To parse this JSON data, do
//
//     final userdata = userdataFromJson(jsonString);

import 'dart:convert';

Userdata userdataFromJson(String str) => Userdata.fromJson(json.decode(str));

String userdataToJson(Userdata data) => json.encode(data.toJson());

class Userdata {
  String faculty;
  String nameEn;
  String id;
  String major;
  String password;
  String email;
  String nameTh;
  String status;
  String degree;
  int level;

  Userdata({
    this.faculty,
    this.nameEn,
    this.id,
    this.major,
    this.password,
    this.email,
    this.nameTh,
    this.status,
    this.degree,
    this.level,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
    faculty: json["Faculty"],
    nameEn: json["NameEN"],
    id: json["Id"],
    major: json["Major"],
    password: json["Password"],
    email: json["Email"],
    nameTh: json["NameTH"],
    status: json["Status"],
    degree: json["Degree"],
    level: json["Level"],
  );

  Map<String, dynamic> toJson() => {
    "Faculty": faculty,
    "NameEN": nameEn,
    "Id": id,
    "Major": major,
    "Password": password,
    "Email": email,
    "NameTH": nameTh,
    "Status": status,
    "Degree": degree,
    "Level": level,
  };
}
