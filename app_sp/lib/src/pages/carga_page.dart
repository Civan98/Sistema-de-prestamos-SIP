import 'package:flutter/material.dart';
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:spi_salario/src/providers/usuarios_provider.dart';

class CargaPage extends StatefulWidget {
  @override
  _CargaPageState createState() => _CargaPageState();
}

class _CargaPageState extends State<CargaPage> {
  final usuariosProvider = new UsuariosProvider();
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    _asignacionID();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Iniciando Sesión...',
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

  _asignacionID() async {
    await usuariosProvider.iduser(prefs
        .email); //funcion para asignar el ID actual a los valores de preferencia
    Navigator.pushReplacementNamed(context, 'home');
  }
}
