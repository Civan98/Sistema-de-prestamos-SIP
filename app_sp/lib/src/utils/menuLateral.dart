import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget menuLateral(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          //cambiar por el logo
          child: Center(
            child: Image(
              image: AssetImage("assets/images/sp-salario_background.png"),
            ),
          ),
          //cambiar por color del theme
          //decoration: BoxDecoration(color: Colors.blue[800]),
        ),
        ListTile(
          leading: Image(
            image: AssetImage("assets/images/sp-salario_background.png"),
            width: 40.0,
            height: 40.0,
          ),
          title: Text('Inicio'),
          onTap: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
        Divider(),
        //expansion(context),
        ListTile(
          leading: SvgPicture.asset(
            'assets/icons/BOTONES-CAPACIDAD.svg',
            width: 40.0,
            height: 40.0,
          ),
          title: Text('Consulta tu capacidad de crédito'),
          onTap: () {
            Navigator.pushNamed(context, 'consultaCapacidad');
          },
        ),
        Divider(),
        ListTile(
          leading: SvgPicture.asset(
            'assets/icons/BOTONES-PRES.svg',
            width: 40.0,
            height: 40.0,
          ),
          title: Text('Consulta tus préstamos'),
          onTap: () {
            Navigator.pushNamed(context, 'home');
          },
        ),
        Divider(),
        ListTile(
          leading: SvgPicture.asset(
            'assets/icons/BOTONES-SOLICITUD.svg',
            width: 40.0,
            height: 40.0,
          ),
          title: Text('Crear solicitud'),
          onTap: () {
            Navigator.pushNamed(context, 'solicitudes');
          },
        ),
        Divider(),
        ListTile(
          leading: SvgPicture.asset(
            'assets/icons/BOTON-CAPACITACION.svg',
            width: 40.0,
            height: 40.0,
          ),
          title: Text('Capacitación en línea'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: SvgPicture.asset(
            'assets/icons/BOTON-SOPORTE.svg',
            width: 40.0,
            height: 40.0,
          ),
          title: Text('Soporte en Línea '),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.message,
            color: Theme.of(context).primaryColor,
          ),
          title: Text('SP mensajes'),
          onTap: () {
            Navigator.pushNamed(context, 'mensaje');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Theme.of(context).primaryColor,
          ),
          title: Text('Cerrar sesión'),
          onTap: () {
            //mando a la pantalla de carga para borrar los datos
            Navigator.pushReplacementNamed(context, 'logout');
          },
        ),
        Divider(),
      ],
    ),
  );
}
