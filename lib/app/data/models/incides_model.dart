// To parse this JSON data, do
//
//     final incidencesModel = incidencesModelFromJson(jsonString);

import 'dart:convert';

IncidencesModel incidencesModelFromJson(String str) =>
    IncidencesModel.fromJson(json.decode(str));

String incidencesModelToJson(IncidencesModel data) =>
    json.encode(data.toJson());

class IncidencesModel {
  IncidencesModel({
    required this.error,
    required this.mensaje,
    required this.incides,
  });

  bool error;
  String mensaje;
  List<Incide> incides;

  factory IncidencesModel.fromJson(Map<String, dynamic> json) =>
      IncidencesModel(
        error: json["error"],
        mensaje: json["mensaje"],
        incides: json["incides"] != null
            ? List<Incide>.from(json["incides"].map((x) => Incide.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "mensaje": mensaje,
        "incides": List<dynamic>.from(incides.map((x) => x.toJson())),
      };
}

class Incide {
  Incide({
    required this.idInci,
    required this.descripcion,
    required this.instEduc,
    required this.codModul,
    required this.codLocal,
    required this.distrito,
    required this.provincia,
    required this.region,
    required this.dirNombApell,
    required this.dirTelefono,
    required this.dirDni,
    required this.dirCorreo,
    required this.cistNombApell,
    required this.cistTelefono,
    required this.cistDni,
    required this.cistCorreo,
    required this.userId,
    required this.usuario,
    required this.userPhone,
    required this.idEstaInci,
    required this.nameEstaInci,
  });

  int idInci;
  String descripcion;
  String instEduc;
  String codModul;
  String codLocal;
  String distrito;
  String provincia;
  String region;
  String dirNombApell;
  String dirTelefono;
  String dirDni;
  String dirCorreo;
  String cistNombApell;
  String cistTelefono;
  String cistDni;
  String cistCorreo;
  int userId;
  String usuario;
  String userPhone;
  int idEstaInci;
  String nameEstaInci;

  factory Incide.fromJson(Map<String, dynamic> json) => Incide(
        idInci: json["idInci"],
        descripcion: json["descripcion"].toString(),
        instEduc: json["inst_educ"].toString(),
        codModul: json["cod_modul"].toString(),
        codLocal: json["cod_local"].toString(),
        distrito: json["distrito"].toString(),
        provincia: json["provincia"].toString(),
        region: json["region"].toString(),
        dirNombApell: json["dir_nomb_apell"].toString(),
        dirTelefono: json["dir_telefono"].toString(),
        dirDni: json["dir_dni"].toString(),
        dirCorreo: json["dir_correo"].toString(),
        cistNombApell: json["cist_nomb_apell"].toString(),
        cistTelefono: json["cist_telefono"].toString(),
        cistDni: json["cist_dni"].toString(),
        cistCorreo: json["cist_correo"].toString(),
        userId: json["user_id"],
        usuario: json["usuario"].toString(),
        userPhone: json["user_phone"].toString(),
        idEstaInci: json["id_esta_inci"],
        nameEstaInci: json["name_esta_inci"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "idInci": idInci,
        "descripcion": descripcion,
        "inst_educ": instEduc,
        "cod_modul": codModul,
        "cod_local": codLocal,
        "distrito": distrito,
        "provincia": provincia,
        "region": region,
        "dir_nomb_apell": dirNombApell,
        "dir_telefono": dirTelefono,
        "dir_dni": dirDni,
        "dir_correo": dirCorreo,
        "cist_nomb_apell": cistNombApell,
        "cist_telefono": cistTelefono,
        "cist_dni": cistDni,
        "cist_correo": cistCorreo,
        "user_id": userId,
        "usuario": usuario,
        "user_phone": userPhone,
        "id_esta_inci": idEstaInci,
        "name_esta_inci": nameEstaInci,
      };
}
