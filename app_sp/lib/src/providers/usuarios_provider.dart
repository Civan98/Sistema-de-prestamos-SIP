import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:spi_salario/src/models/usuario_model.dart';
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:spi_salario/src/providers/usuario_provider.dart';

class UsuariosProvider {
  final String _url = 'https://spi-salario.firebaseio.com';
  final prefs = new PreferenciasUsuario();

  final usuarioProvider = new UsuarioProvider();

  Future<bool> registrarUsuario(UsuarioModel usuario) async {
    final url = '$_url/usuarios.json'; //en esta parte se borro lo del token

    final buscarRFC = await _existeUsuario(usuario, url);
    if (!buscarRFC) {
      //manda a crear un usuario para la autenticacion
      usuarioProvider.nuevoUsuario(usuario.email, usuario.password);
//FALTA VALIDAR CORREO mirar video 233

      final resp = await http.post(url, body: usuarioModelToJson(usuario));

      final decodedData = json.decode(resp.body);
      print(decodedData);
      return true;
    } else {
      //print('El rfc ya ha sido registrado');
      return false;
    }
  }

  Future<bool> _existeUsuario(UsuarioModel usuario, String url) async {
    bool existe = false;

    final resp = await http.get(url);
    //almacenar la información en un map, y después buscar el rfc
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    //final List<UsuarioModel> usuarios = new List();
    if (decodedData == null) return existe;

    for (var item in decodedData.values) {
      final usuarioTemp = UsuarioModel.fromJson(item);
      if (usuario.rfc == usuarioTemp.rfc ||
          usuario.email == usuarioTemp.email) {
        existe = true;
        break;
      }

      //print(item['nombre']);

    }
    //el foreach no se puede detener
    // decodedData.forEach((id, datos) {
    //   final usuarioTemp = UsuarioModel.fromJson(datos);
    //   if (usuario.rfc == usuarioTemp.rfc) {
    //     existe = true;
    //     return existe;
    //   }
    // });

    return existe;
  }

  Future<String> iduser(String email) async {
    String iduser = "";
    int contador = 0;//para obtener el indice del dato a llamar
    final url = '$_url/usuarios.json?auth=${prefs.token}';//en casos de error borrar lo del token 
    final resp = await http.get(url);
    //almacenar la información en un map, y después buscar el ID
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    if (decodedData == null) return iduser;

    for (var item in decodedData.values) {
      
      final tes = decodedData.keys; //se asigna los ID a esta lista
      final usuarioTemp = UsuarioModel.fromJson(item);
      if (email == usuarioTemp.email) {
        //iduser = item.toString();
        //print(contador);
        iduser = tes.elementAt(contador); //obtener el id de la lista
        prefs.iduser = tes.elementAt(contador); //almacena el ID en las preferencias del usuario
        
        break;
      }
      contador++;
    }
    //print(decodedData.keys);//imprime el listado de todas las keys
    //print(iduser);
    return iduser;
  }

  //obtener datos del usaurio
  Future<List<UsuarioModel>> obtenerUsuario(String usuario) async {
    final url ='$_url/usuarios/$usuario.json?auth=${prefs.token}'; //en casos de error borrar lo del token 
    final datosUsuario = await http.get(url);
    final Map<String, dynamic> decodedData = json.decode(datosUsuario.body);
    final List<UsuarioModel> datosU = new List();
    if (decodedData == null) return [];
//para una sola colección se envía el objeto completo, pues no necesita iterar entre 2 mapas.
    final userTemp = UsuarioModel.fromJson(decodedData);
    //print(userTemp.apellidos);
    datosU.add(userTemp);
    //print(datosU);
    //datosU.add(userTemp.apellidos);

    return datosU;
  }
}
