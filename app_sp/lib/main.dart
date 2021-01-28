import 'package:flutter/material.dart';
import 'package:spi_salario/solucitudesPages/solicitud_page.dart';
import 'package:spi_salario/src/SP_mensajesPages/mensajes_page.dart';
import 'package:spi_salario/src/bloc/provider.dart';
import 'package:spi_salario/src/cone_mysql/conexion.dart';
import 'package:spi_salario/src/consulta_capacidadPages/capacidad_page.dart';
import 'package:spi_salario/src/consulta_capacidadPages/detalleOtorgamiento_page.dart';
import 'package:spi_salario/src/consulta_capacidadPages/detallePrereserva_Page.dart';
import 'package:spi_salario/src/consulta_capacidadPages/detalleReserva_page.dart';
import 'package:spi_salario/src/pages/carga_page.dart';
import 'package:spi_salario/src/pages/detalles1_page.dart';
import 'package:spi_salario/src/pages/detalles2_page.dart';
import 'package:spi_salario/src/pages/home_page.dart';
import 'package:spi_salario/src/pages/login_page.dart';
import 'package:spi_salario/src/pages/logout_page.dart';
import 'package:spi_salario/src/pages/registro_page.dart';
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:spi_salario/src/prestamosPages/consultarPrestamos_page.dart';
import 'package:spi_salario/src/prestamosPages/detallesPrestamo_page.dart';
import 'src/pages/restaurar_page.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //despues de que se actulizo flutter surge un error al meter una funcion async al main con esto se quita
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    //print(prefs.token); //imprime el token
    //print(prefs.email); //imprime el email
    return Provider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SPI-SALARIO',
      initialRoute: 'getdata',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'registro': (BuildContext context) => RegistroPage(),
        'detalles1': (BuildContext context) => Detalles1Page(),
        'detalles2': (BuildContext context) => Detalles2Page(),
        'restaurar': (BuildContext context) => ReataurarPage(),
        'carga': (BuildContext context) => CargaPage(),
        'logout': (BuildContext context) => LogoutPage(),
        'consultarPrestamos': (BuildContext context) =>
            ConsultarPrestamosPage(),
        'detallesPrestamo': (BuildContext context) => DetallesPrestamoPage(),
        //RUTAS DE CONSULTA CAPACIDAD//
        'consultaCapacidad': (BuildContext context) => CapacidadPage(),
        'dReserva': (BuildContext context) => DReservaPage(),
        'dPreReserva': (BuildContext context) => DPreReservaPage(),
        'dOtorgamiento': (BuildContext context) => DotorgamientoPage(),
        'solicitudes':(BuildContext context) => SolicitudPage(),
        'mensaje': (BuildContext context) => MensajePage(),
        'getdata': (BuildContext context) => Getdata(),

      },
      theme: ThemeData(primaryColor: Colors.blue[800]),
    ));
  }
}
