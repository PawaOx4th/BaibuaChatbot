// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

List<Login> loginFromJson(String str) => List<Login>.from(json.decode(str).map((x) => Login.fromJson(x)));

String loginToJson(List<Login> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Login {
  String userId;
  String userPassword;
  String userEmail;

  Login({
    this.userId,
    this.userPassword,
    this.userEmail,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    userId: json["userId"],
    userPassword: json["userPassword"],
    userEmail: json["userEmail"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userPassword": userPassword,
    "userEmail": userEmail,
  };
}
