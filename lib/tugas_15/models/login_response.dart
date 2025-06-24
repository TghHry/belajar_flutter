// To parse this JSON data, do
//
//     final erors = erorsFromJson(jsonString);

import 'dart:convert';

Erors erorsFromJson(String str) => Erors.fromJson(json.decode(str));

String erorsToJson(Erors data) => json.encode(data.toJson());

class Erors {
  String message;

  Erors({required this.message});

  factory Erors.fromJson(Map<String, dynamic> json) =>
      Erors(message: json["message"]);

  Map<String, dynamic> toJson() => {"message": message};
}