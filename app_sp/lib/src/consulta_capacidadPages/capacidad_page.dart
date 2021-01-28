import 'package:flutter/material.dart';

class CapacidadPage extends StatefulWidget {
  const CapacidadPage({Key key}) : super(key: key);

  @override
  _CapacidadPageState createState() => _CapacidadPageState();
}

class _CapacidadPageState extends State<CapacidadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta Capacidad'),
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
          height: size.height * 0.05,
        ),
        datosConsulta(context),
      ],
    ));
  }

  Widget datosConsulta(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView(
        // padding: EdgeInsets.symmetric(vertical: 10.0),
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '     Tipo de nomina',
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
                '     Capacidad',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '\$ 25,965.60',
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
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'dPreReserva');
                  },
                  child: Text(
                    '     Pre Reservas',
                    style: TextStyle(fontSize: size.width * 0.05),
                  )),
              Text(
                '\$0.00',
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
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'dReserva');
                  },
                  child: Text(
                    '     Reservas',
                    style: TextStyle(fontSize: size.width * 0.05),
                  )),
              Text(
                '\$0.00',
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
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'dOtorgamiento');
                  },
                  child: Text(
                    '     Otorgamiento',
                    style: TextStyle(fontSize: size.width * 0.05),
                  )),
              Text(
                '\$0.00',
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
                '     Cap. disponible',
                style: TextStyle(fontSize: size.width * 0.05),
              ),
              Text(
                '\$ 25,965.60',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: size.width * 0.05, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          _botonDetallesGenerales()
        ],
      ),
    );
  }

  Widget _botonDetallesGenerales() {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          child: Text('Detalles Generales'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, 'detalles2');
        });
  }
}
