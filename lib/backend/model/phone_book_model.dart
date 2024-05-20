// To parse this JSON data, do
//
//     final phoneBookModel = phoneBookModelFromJson(jsonString);

import 'dart:convert';

PhoneBookModel phoneBookModelFromJson(String str) =>
    PhoneBookModel.fromJson(json.decode(str));

String phoneBookModelToJson(PhoneBookModel data) => json.encode(data.toJson());

class PhoneBookModel {
  int status;
  String message;
  List<Datum> data;

  PhoneBookModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PhoneBookModel.fromJson(Map<String, dynamic> json) => PhoneBookModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  dynamic name;
  dynamic phone;

  Datum({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"] ?? '',
        phone: json["phone"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
