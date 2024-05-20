// To parse this JSON data, do
//
//     final appBannerModel = appBannerModelFromJson(jsonString);

import 'dart:convert';

AppBannerModel appBannerModelFromJson(String str) =>
    AppBannerModel.fromJson(json.decode(str));

String appBannerModelToJson(AppBannerModel data) => json.encode(data.toJson());

class AppBannerModel {
  int status;
  String message;
  String data;

  AppBannerModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AppBannerModel.fromJson(Map<String, dynamic> json) => AppBannerModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
