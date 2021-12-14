// To parse this JSON data, do
//
//     final stateInciModel = stateInciModelFromJson(jsonString);

import 'dart:convert';

StateInciModel stateInciModelFromJson(String str) => StateInciModel.fromJson(json.decode(str));

String stateInciModelToJson(StateInciModel data) => json.encode(data.toJson());

class StateInciModel {
  StateInciModel({
    required this.error,
    required this.mensaje,
    required this.stateInci,
  });

  bool error;
  String mensaje;
  List<StateInci> stateInci;

  factory StateInciModel.fromJson(Map<String, dynamic> json) => StateInciModel(
    error: json["error"],
    mensaje: json["mensaje"],
    stateInci: List<StateInci>.from(json["stateInci"].map((x) => StateInci.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "mensaje": mensaje,
    "stateInci": List<dynamic>.from(stateInci.map((x) => x.toJson())),
  };
}

class StateInci {
  StateInci({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory StateInci.fromJson(Map<String, dynamic> json) => StateInci(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
