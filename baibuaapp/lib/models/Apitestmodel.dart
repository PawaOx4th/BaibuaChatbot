// To parse this JSON data, do
//
//     final apitestmodel = apitestmodelFromJson(jsonString);

import 'dart:convert';

List<Apitestmodel> apitestmodelFromJson(String str) => List<Apitestmodel>.from(json.decode(str).map((x) => Apitestmodel.fromJson(x)));

String apitestmodelToJson(List<Apitestmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Apitestmodel {
  String userPassword;
  int userLevel;
  String userLname;
  String userEmail;
  String userId;
  String userFname;

  Apitestmodel({
    this.userPassword,
    this.userLevel,
    this.userLname,
    this.userEmail,
    this.userId,
    this.userFname,
  });

  factory Apitestmodel.fromJson(Map<String, dynamic> json) => Apitestmodel(
    userPassword: json["userPassword"],
    userLevel: json["userLevel"],
    userLname: json["userLname"],
    userEmail: json["userEmail"],
    userId: json["userId"],
    userFname: json["userFname"],
  );

  Map<String, dynamic> toJson() => {
    "userPassword": userPassword,
    "userLevel": userLevel,
    "userLname": userLname,
    "userEmail": userEmail,
    "userId": userId,
    "userFname": userFname,
  };
}
