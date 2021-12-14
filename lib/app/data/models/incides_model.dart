// To parse this JSON data, do
//
//     final incidencesModel = incidencesModelFromJson(jsonString);

import 'dart:convert';

IncidencesModel incidencesModelFromJson(String str) => IncidencesModel.fromJson(json.decode(str));

String incidencesModelToJson(IncidencesModel data) => json.encode(data.toJson());

class IncidencesModel {
  IncidencesModel({
    required this.error,
    required this.mensaje,
    required this.incides,
  });

  bool error;
  String mensaje;
  List<Incide> incides;

  factory IncidencesModel.fromJson(Map<String, dynamic> json) => IncidencesModel(
    error: json["error"],
    mensaje: json["mensaje"],
    incides: List<Incide>.from(json["incides"].map((x) => Incide.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "mensaje": mensaje,
    "incides": List<dynamic>.from(incides.map((x) => x.toJson())),
  };
}

class Incide {
  Incide({
    required this.id,
    required this.idUser,
    required this.idEstadoIncid,
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
    required this.idRole,
    required this.name,
    required this.lastname,
    required this.phone,
    required this.user,
    required this.password,
    required this.active,
  });

  int id;
  int idUser;
  int idEstadoIncid;
  String descripcion;
  String instEduc;
  String codModul;
  String codLocal;
  String distrito;
  String provincia;
  String region;
  String dirNombApell;
  int dirTelefono;
  int dirDni;
  String dirCorreo;
  String cistNombApell;
  int cistTelefono;
  int cistDni;
  String cistCorreo;
  int idRole;
  String name;
  String lastname;
  int phone;
  String user;
  String password;
  int active;

  factory Incide.fromJson(Map<String, dynamic> json) => Incide(
    id: json["id"],
    idUser: json["id_user"],
    idEstadoIncid: json["id_estado_incid"],
    descripcion: json["descripcion"],
    instEduc: json["inst_educ"],
    codModul: json["cod_modul"],
    codLocal: json["cod_local"],
    distrito: json["distrito"],
    provincia: json["provincia"],
    region: json["region"],
    dirNombApell: json["dir_nomb_apell"],
    dirTelefono: json["dir_telefono"],
    dirDni: json["dir_dni"],
    dirCorreo: json["dir_correo"],
    cistNombApell: json["cist_nomb_apell"],
    cistTelefono: json["cist_telefono"],
    cistDni: json["cist_dni"],
    cistCorreo: json["cist_correo"],
    idRole: json["id_role"],
    name: json["name"],
    lastname: json["lastname"],
    phone: json["phone"],
    user: json["user"],
    password: json["password"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_user": idUser,
    "id_estado_incid": idEstadoIncid,
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
    "id_role": idRole,
    "name": name,
    "lastname": lastname,
    "phone": phone,
    "user": user,
    "password": password,
    "active": active,
  };
}
