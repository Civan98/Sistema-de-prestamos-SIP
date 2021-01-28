import 'package:flutter/material.dart';

class DotorgamientoPage extends StatefulWidget {
  const DotorgamientoPage({Key key}) : super(key: key);

  @override
  _DotorgamientoPageState createState() => _DotorgamientoPageState();
}

class _DotorgamientoPageState extends State<DotorgamientoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Otorgamiento'),
      ),
      body: cargarDetalles(context),
    );
  }

  Widget cargarDetalles(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
        child: ListView(
      children: <Widget>[
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          'Aldo Valdez Solís',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: size.width * 0.06),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          'Dependencia: Secretaria de Educación Publica',
          style: TextStyle(fontSize: size.width * 0.05),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          'RFC: CUPU800825569',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: size.width * 0.05),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        datosPrestamo(context),
      ],
    ));
  }

  Widget datosPrestamo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView(
        // padding: EdgeInsets.symmetric(vertical: 10.0),
        shrinkWrap: true,
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Etapa',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                'FONE',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Financiera',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                'Bansefi',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'No. Solicitud',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '123',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Fecha',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '19/11/2020',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Monto Solicitado',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '\$1000.00',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Qnas. a Descontar',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '5',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Monto Qnal.',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '\$200',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
