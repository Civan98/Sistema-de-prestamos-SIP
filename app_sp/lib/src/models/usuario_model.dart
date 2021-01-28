// To parse this JSON data, do
//
//     final usuarioModel = usuarioModelFromJson(jsonString);

import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel({
    this.id,
    this.nombre = '',
    this.apellidos = '',
    this.rfc = '',
    this.email = '',
    this.password = '',
    this.fotoUrl,
    this.saldo = 0.0,
    this.saldodisponible = 0.0,
    this.capacidadactual = 0.0,
  });

  String id;
  String nombre;
  String apellidos;
  String rfc;
  String email;
  String password;
  String fotoUrl;
  double saldo;
  double saldodisponible;
  double capacidadactual;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
      id: json["id"],
      nombre: json["nombre"],
      apellidos: json["apellidos"],
      rfc: json["rfc"],
      email: json["email"],
      password: json["password"],
      fotoUrl: json["fotoUrl"],
      saldo: json["saldo"] / 1,
      saldodisponible: json["saldodisponible"] / 1,
      capacidadactual: json["capacidadactual"] / 1);

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "rfc": rfc,
        "email": email,
        "password": password,
        "fotoUrl": fotoUrl,
        "saldo": saldo,
        "saldodisponible": saldodisponible,
        "capacidadactual": capacidadactual,
      };
}
