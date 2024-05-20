// To parse this JSON data, do
//
//     final insertComplainModel = insertComplainModelFromJson(jsonString);

import 'dart:convert';

InsertComplainModel insertComplainModelFromJson(String str) =>
    InsertComplainModel.fromJson(json.decode(str));

String insertComplainModelToJson(InsertComplainModel data) =>
    json.encode(data.toJson());

class InsertComplainModel {
  dynamic success;
  dynamic message;

  InsertComplainModel({
    required this.success,
    required this.message,
  });

  factory InsertComplainModel.fromJson(Map<String, dynamic> json) =>
      InsertComplainModel(
        success: json["success"],
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
