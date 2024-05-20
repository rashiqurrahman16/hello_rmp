// To parse this JSON data, do
//
//     final otpInputModel = otpInputModelFromJson(jsonString);

import 'dart:convert';

OtpInputModel otpInputModelFromJson(String str) =>
    OtpInputModel.fromJson(json.decode(str));

String otpInputModelToJson(OtpInputModel data) => json.encode(data.toJson());

class OtpInputModel {
  bool success;
  int code;
  String message;

  OtpInputModel({
    required this.success,
    required this.code,
    required this.message,
  });

  factory OtpInputModel.fromJson(Map<String, dynamic> json) => OtpInputModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
      };
}
