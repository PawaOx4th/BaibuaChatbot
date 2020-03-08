// To parse this JSON data, do
//
//     final studentGroup = studentGroupFromJson(jsonString);

import 'dart:convert';

StudentGroup studentGroupFromJson(String str) =>
    StudentGroup.fromJson(json.decode(str));

String studentGroupToJson(StudentGroup data) => json.encode(data.toJson());

class StudentGroup {
  String id;
  String student;

  StudentGroup({
    this.id,
    this.student,
  });

  factory StudentGroup.fromJson(Map<String, dynamic> json) => StudentGroup(
        id: json["Id"],
        student: json["Student"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Student": student,
      };
}
