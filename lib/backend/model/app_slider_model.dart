// To parse this JSON data, do
//
//     final appSliderModel = appSliderModelFromJson(jsonString);

import 'dart:convert';

List<AppSliderModel> appSliderModelFromJson(String str) =>
    List<AppSliderModel>.from(
        json.decode(str).map((x) => AppSliderModel.fromJson(x)));

String appSliderModelToJson(List<AppSliderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppSliderModel {
  int id;
  dynamic title;
  dynamic imageUrl;

  AppSliderModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory AppSliderModel.fromJson(Map<String, dynamic> json) => AppSliderModel(
        id: json["id"],
        title: json["title"] ?? '',
        imageUrl: json["image_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
      };
}
