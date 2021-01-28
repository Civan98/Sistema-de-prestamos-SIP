import 'package:flutter/material.dart';

class MensajePage extends StatefulWidget {
  MensajePage({Key key}) : super(key: key);

  @override
  _MensajePageState createState() => _MensajePageState();
}

class _MensajePageState extends State<MensajePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SP Mensajes'),
      ),
      body: listaMensajes(context),
    );
  }

  Widget listaMensajes(BuildContext context) {
    //se debe cambiar por un listview builder con infinite scroll
    final size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        SizedBox(height: size.height * 0.02),
        ListTile(
          title: Text('05-Nov-2020 13:00:36'),
          subtitle: Text(
            'Se canceló tu solicitud de crédito en PRESTAMOS EN EFECTIVO con número de solicitud 12587 y monto solicitado 2000.00',
            textAlign: TextAlign.justify,
          ), 
          trailing: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              '   No leído   ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {
            //Navigator.pushNamed(context, 'detallesPrestamo');
          },
        ),
        Divider(),
        SizedBox(height: size.height * 0.01),
        ListTile(
          title: Text('0-Oct-2020 22:55:29'),
          subtitle: Text(
            'Se canceló tu otorgamiento en FINANCIERA MAESTRA S.A.DE C.V. SOFOM E.N.R con número de solicitud 12399',
            textAlign: TextAlign.justify,
          ),
          trailing: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              '   No leído   ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {},
        ),
        Divider(),
        SizedBox(height: size.height * 0.01),
        ListTile(
          title: Text('20-Oct-2020 22:55:06'),
          subtitle: Text(
            'Se canceló tu otorgamiento en FINANCIERA MAESTRA S.A.DE C.V. SOFOM E.N.R con número de solicitud 12397',
            textAlign: TextAlign.justify,
          ),
          trailing: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              '   No leído   ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {},
        ),
        Divider(),
        SizedBox(height: size.height * 0.01),
        ListTile(
          title: Text('20-Oct-2020 22:54:20'),
          subtitle: Text(
            '	Se otorgó su solicitud de crédito en la empresa: FINANCIERA MAESTRA S.A.DE C.V. SOFOM E.N.R, con número de solicitud: 12399, nombre del producto: PRESTAMOS EN EFECTIVO, con un monto solicitado de: \$2000.00 a 12 quincenas.',
            textAlign: TextAlign.justify,
          ),
          trailing: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              '   No leído   ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {},
        ),
        Divider(),
        SizedBox(height: size.height * 0.01),
        ListTile(
          title: Text('20-Oct-2020 22:52:38'),
          subtitle: Text(
            'Se reservó tu solicitud de crédito en FINANCIERA MAESTRA S.A.DE C.V. SOFOM E.N.R con número de solicitud 12399',
            textAlign: TextAlign.justify,
          ),
          trailing: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              '   No leído   ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {},
        ),
        Divider(),
        SizedBox(height: size.height * 0.01),
        ListTile(
          title: Text('20-Oct-2020 22:51:49'),
          subtitle: Text(
            'La empresa: FINANCIERA MAESTRA S.A.DE C.V. SOFOM E.N.R, te ha generado una solicitud de crédito con número de solicitud: 12399, nombre de producto: PRESTAMOS EN EFECTIVO, con un monto solicitado de: \$2000.00 a 12 Quincenas, si No estas de acuerdo reportalo de forma inmediata.',
            textAlign: TextAlign.justify,
          ),
          trailing: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              '   No leído   ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {},
        ),
        Divider(),
        SizedBox(height: size.height * 0.01),
        ListTile(
          title: Text('20-Oct-2020 16:26:12'),
          subtitle: Text(
            'Se otorgó su solicitud de crédito en la empresa: FINANCIERA MAESTRA S.A.DE C.V. SOFOM E.N.R, con número de solicitud: 12397, nombre del producto: PRESTAMOS EN EFECTIVO 120 QNAS, con un monto solicitado de: \$10000.00 a 120 quincenas.',
            textAlign: TextAlign.justify,
          ),
          trailing: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              '   No leído   ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
