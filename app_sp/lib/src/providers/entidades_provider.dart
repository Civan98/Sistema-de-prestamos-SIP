import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:spi_salario/src/models/entidades_model.dart';
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';

class EntidadesProvider {
  final String _url = 'https://spi-salario.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<List<EntidadModel>> cargarEntidades(String idUsuario) async {
    

    final url = "$_url/entidadfinanciera.json?auth=${_prefs.token}";

    final resp = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<EntidadModel> entidades = new List();
    if (decodedData == null) return [];

    for (var item in decodedData.values) {
      final entidadesTemp = EntidadModel.fromJson(item);
      if (idUsuario == entidadesTemp.idusuario) {
        entidades.add(entidadesTemp);
      }
    }

    // decodedData.forEach((id, entidad) {
    //   final entidTemp = EntidadModel.fromJson(entidad);
    //   if (idUsuario == entidTemp.idUser.toString()) {
    //     entidTemp.id = id;
    //     entidades.add(entidTemp);
    //   }
    // });

    //print(entidades.length);
    return entidades;
  }
}
