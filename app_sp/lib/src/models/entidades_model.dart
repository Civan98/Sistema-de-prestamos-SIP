// To parse this JSON data, do
//
//     final entidadModel = entidadModelFromJson(jsonString);

import 'dart:convert';

EntidadModel entidadModelFromJson(String str) =>
    EntidadModel.fromJson(json.decode(str));

String entidadModelToJson(EntidadModel data) => json.encode(data.toJson());

class EntidadModel {
  EntidadModel({
    this.id = "",
    this.idusuario = "",
    this.nombre = "",
    this.saldo = 0.0,
    this.qnasrestante = 0,
    this.status = "",
    this.solicitud = 0,
    this.importe = 0.0,
    this.cuotas = 0,
    this.montoqnal = 0.0,
  });

  String id;
  String idusuario;
  String nombre;
  double saldo;
  int qnasrestante;
  String status;
  int solicitud;
  double importe;
  int cuotas;
  double montoqnal;

  factory EntidadModel.fromJson(Map<String, dynamic> json) => EntidadModel(
        id: json["id"],
        idusuario: json["idusuario"],
        nombre: json["nombre"],
        saldo: json["saldo"] / 1,
        qnasrestante: json["qnasrestante"],
        status: json["status"],
        solicitud: json["solicitud"],
        importe: json["importe"] / 1,
        cuotas: json["cuotas"],
        montoqnal: json["montoqnal"] / 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idusuario": idusuario,
        "nombre": nombre,
        "saldo": saldo,
        "qnasrestante": qnasrestante,
        "estatus": status,
        "solicitud": solicitud,
        "importe": importe,
        "cuotas": cuotas,
        "montoqnal": montoqnal,
      };
}
