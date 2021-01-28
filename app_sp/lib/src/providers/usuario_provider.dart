import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';

class UsuarioProvider {
  final String _firebaseToken = 'AIzaSyCx8DdaNmjbkQlblmHcnkV7gWjLePL_reM';
  final _prefs = PreferenciasUsuario();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    print('aldo');
    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken',
        body: json.encode(authData));
    Map<String, dynamic> decodedResp = json.decode(resp.body);

    _prefs.email = decodedResp[
        'email']; //se guarda en los valores internos el email del usuario logeado
    //print(decodedResp['email']);

    if (decodedResp.containsKey('idToken')) {
      _prefs.token =
          decodedResp['idToken']; // se lamacena el token en el dispositivo

      _prefs.token =
          decodedResp['idToken']; // se lamacena el token en el dispositivo
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> restablecercontra(String email) async {
    final authData = {
      "requestType": "PASSWORD_RESET",
      'email': email, //correo de ejemplo
    };

    final resp = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);

    //NO BORRAR ESTO SERA EL MENSAJE QUE RETORNARA SI ALGO SALE MAL, CORREO NO ENCONTRADO POR EJEMPLO
    print(decodedResp);
    if (decodedResp.containsKey('kind')) {
      return {'ok': true, 'kind': decodedResp['kind']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }
}
