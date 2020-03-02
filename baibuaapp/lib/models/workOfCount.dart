// To parse this JSON data, do
//
//     final workofCountModel = workofCountModelFromJson(jsonString);

import 'dart:convert';

WorkofCountModel workofCountModelFromJson(String str) => WorkofCountModel.fromJson(json.decode(str));

String workofCountModelToJson(WorkofCountModel data) => json.encode(data.toJson());

class WorkofCountModel {
    int status;
    int data;

    WorkofCountModel({
        this.status,
        this.data,
    });

    factory WorkofCountModel.fromJson(Map<String, dynamic> json) => WorkofCountModel(
        status: json["status"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
    };
}
