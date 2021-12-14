// To parse this JSON data, do
//
//     final fichasModel = fichasModelFromJson(jsonString);

import 'dart:convert';

FichasModel fichasModelFromJson(String str) => FichasModel.fromJson(json.decode(str));

String fichasModelToJson(FichasModel data) => json.encode(data.toJson());

class FichasModel {
  FichasModel({
    required this.error,
    required this.mensaje,
    required this.fichas,
  });

  bool error;
  String mensaje;
  List<Ficha> fichas;

  factory FichasModel.fromJson(Map<String, dynamic> json) => FichasModel(
    error: json["error"],
    mensaje: json["mensaje"],
    fichas: List<Ficha>.from(json["fichas"].map((x) => Ficha.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "mensaje": mensaje,
    "fichas": List<dynamic>.from(fichas.map((x) => x.toJson())),
  };
}

class Ficha {
  Ficha({
    required this.idIncid,
    required this.idTipoIncid,
    required this.marca,
    required this.modelo,
    required this.serie,
    required this.estado,
    required this.ubicacion,
    required this.observaciones,
  });

  int idIncid;
  int idTipoIncid;
  String marca;
  String modelo;
  String serie;
  String estado;
  String ubicacion;
  String observaciones;

  factory Ficha.fromJson(Map<String, dynamic> json) => Ficha(
    idIncid: json["id_incid"],
    idTipoIncid: json["id_tipo_incid"],
    marca: json["marca"],
    modelo: json["modelo"],
    serie: json["serie"],
    estado: json["estado"],
    ubicacion: json["ubicacion"],
    observaciones: json["observaciones"],
  );

  Map<String, dynamic> toJson() => {
    "id_incid": idIncid,
    "id_tipo_incid": idTipoIncid,
    "marca": marca,
    "modelo": modelo,
    "serie": serie,
    "estado": estado,
    "ubicacion": ubicacion,
    "observaciones": observaciones,
  };
}
