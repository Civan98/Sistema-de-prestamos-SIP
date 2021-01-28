import 'package:flutter/material.dart';

class DetallesPrestamoPage extends StatelessWidget {
  const DetallesPrestamoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del préstamo'),
      ),
      body: cargarDetallesPrestamo(context),
    );
  }

  Widget cargarDetallesPrestamo(BuildContext context) {
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
                'Etapa del préstamo',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                'Otorgado',
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
                'No. folio',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '124124',
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
                'Monto total',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '\$50000.00',
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
                'Qnas',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '50',
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
                'Monto Qnal',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '\$2000.00',
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
                'Abono',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '\$2000.00',
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
                'Saldo',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                'Qnas Restantes',
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
                'Última quincina aplicada',
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
                '% Cubierto',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '70%',
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
