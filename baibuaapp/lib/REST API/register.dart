// To parse this JSON data, do
//
//     final registeruser = registeruserFromJson(jsonString);

import 'dart:convert';

Registeruser registeruserFromJson(String str) => Registeruser.fromJson(json.decode(str));

String registeruserToJson(Registeruser data) => json.encode(data.toJson());

class Registeruser {
  String id;
  String email;
  String password;

  Registeruser({
    this.id,
    this.email,
    this.password,
  });

  factory Registeruser.fromJson(Map<String, dynamic> json) => Registeruser(
    id: json["Id"],
    email: json["Email"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Email": email,
    "Password": password,
  };
}
