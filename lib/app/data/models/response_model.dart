// To parse this JSON data, do
//
//     final responseModel = responseModelFromJson(jsonString);

import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    required this.error,
    required this.id,
    required this.mensaje,
  });

  bool error;
  int id;
  String mensaje;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    error: json["error"],
    id: json["id"] ?? 0,
    mensaje: json["mensaje"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "id": id,
    "mensaje": mensaje,
  };
}
