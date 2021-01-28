import 'package:flutter/material.dart';
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:spi_salario/src/providers/usuarios_provider.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  final usuariosProvider = new UsuariosProvider();
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    _cerrandosesion();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Cerrando Sesión...',
            style: TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.0),
          LinearProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            backgroundColor: Colors.grey[300],
          )
        ],
      )),
    );
  }

  _cerrandosesion() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      await _borrandodatos();
      Navigator.of(context).pushNamedAndRemoveUntil(
          'login',
          (Route<dynamic> route) =>
              false); //elimina toda la pila de pantallas abiertas
    });
  }

  _borrandodatos() {
    // Reseteamos los valores tanto del token como el Email de busqueda
    prefs.token = '';
    prefs.email = '';
    // print(prefs.token);
    //print(prefs.email);
  }
}
