import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spi_salario/src/models/entidades_model.dart';
import 'package:spi_salario/src/models/usuario_model.dart';
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:spi_salario/src/providers/entidades_provider.dart';
import 'package:intl/intl.dart';
import 'package:spi_salario/src/providers/usuarios_provider.dart';
import 'package:spi_salario/src/utils/menuLateral.dart';

class Detalles2Page extends StatefulWidget {
  @override
  _Detalles2PageState createState() => _Detalles2PageState();
}

class _Detalles2PageState extends State<Detalles2Page> {
  final transformarNumero = new NumberFormat.simpleCurrency();
  final entidadesProvider = new EntidadesProvider();
  final usuarioProvider = new UsuariosProvider();
  final prefs = new PreferenciasUsuario();

  EntidadModel datosEnt;
  int tamDataEntidades = 0;
  int indexEstatico = 0;
  // int _value = 1;
  final List<dynamic> celdas = new List();
  final List<dynamic> tituloEstatico = [
    'Solicitud',
    'Importe',
    'Cuotas',
    'Monto Qnal'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: menuLateral(context),
      appBar: AppBar(
        title: Container(
          //margin: EdgeInsets.only(left: size.width * 0.05),
          child: Image(
            image: AssetImage("assets/images/logo_azul.png"),
            width: size.width * 0.4,
          ),
        ),
        centerTitle: true,
      ),
      body: _cargarInfo(context),
    );
  }

//quitar suma si es necesaria en la páfina de detalles1
  Widget _cargarInfo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String idu =
        prefs.iduser; //obtiene el id de los valores de preferencia
    final String newValue = idu.replaceAll(
        " ", ""); // borra el el primer espacio en blanco de la cadena
    //print(newValue);
    return FutureBuilder(
        future: Future.wait([
          usuarioProvider.obtenerUsuario('$newValue'),
          entidadesProvider.cargarEntidades('$newValue')
        ]),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          final datos = snapshot.data;

          if (snapshot.hasData) {
            tamDataEntidades = snapshot.data[1].length;

            for (var i = 0; i < tamDataEntidades; i++) {
              datosEnt = datos[1][i];
              celdas.add(datosEnt.status);
              celdas.add(datosEnt.solicitud);
              celdas.add(datosEnt.importe);
              celdas.add(datosEnt.cuotas);
              celdas.add(datosEnt.montoqnal);
            }
            tamDataEntidades = tamDataEntidades * 5;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.03),
                    _imprimirDatosIniciales(context, datos[0][0]),
                    Container(
                      child: Column(
                        children: <Widget>[
                          DataTable(
                            dataRowHeight: 35.0,
                            dividerThickness: 0,
                            columns: <DataColumn>[
                              DataColumn(
                                  label: Container(
                                      height: 0,
                                      child: Text('datos',
                                          style: TextStyle(
                                              color: Colors.transparent,
                                              fontSize: 0)))),
                              DataColumn(
                                  label: Container(
                                      height: 0,
                                      child: Text('datos',
                                          style: TextStyle(
                                              color: Colors.transparent,
                                              fontSize: 0)))),
                              DataColumn(
                                  label: Container(
                                      height: 0,
                                      child: Text('datos',
                                          style: TextStyle(
                                              color: Colors.transparent,
                                              fontSize: 0)))),
                            ],
                            rows: List.generate(tamDataEntidades, (index) {
                              return _celdas(context, index);
                            }),
                          ),
                          SizedBox(height: size.height * 0.05),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _imprimirDatosIniciales(
      BuildContext context, UsuarioModel datoUsuario) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Text(
          '${datoUsuario.nombre} ${datoUsuario.apellidos}',
          style: TextStyle(fontSize: size.width * 0.06),
        ),
        SizedBox(height: size.height * 0.01),
        Text('Dependencia: Secretaria de Educación Publica',
          style: TextStyle(fontSize: size.width *0.06), textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.01,),
        Text(
          'RFC: ${datoUsuario.rfc}',
          style: TextStyle(color: Colors.black45, fontSize: size.width * 0.05),
        ),
      ],
    );
  }

  DataRow _celdas(BuildContext buildContext, int index) {
    final size = MediaQuery.of(context).size;
    String estado = '';
    String dineroTransformado = '';
    //double dinero = 0;
    bool cabecera = false;
    if (celdas[index] == 'Pre-reserva' ||
        celdas[index] == 'Reserva' ||
        celdas[index] == 'Otorgado') {
      estado = celdas[index];
      dineroTransformado =
          transformarNumero.format(celdas[index + 4]).toString();
      cabecera = true;
      indexEstatico = 0;
    } else {
      estado = tituloEstatico[indexEstatico];

      if (tituloEstatico[indexEstatico] == 'Importe' ||
          tituloEstatico[indexEstatico] == 'Monto Qnal') {
        dineroTransformado = transformarNumero.format(celdas[index]).toString();
      } else {
        dineroTransformado = celdas[index].toString();
      }
      indexEstatico++;
    }

    return DataRow(cells: <DataCell>[
      DataCell(
        Container(
          width: size.width * 0.25,
          child: Text(
            '$estado',
            style: TextStyle(
                fontSize: (cabecera) ? size.width * 0.04 : size.width * 0.035,
                fontWeight: (cabecera) ? FontWeight.bold : null),
          ),
        ),
      ),
      DataCell(
        Container(
          width: size.width * 0.1,
          child: Text(
            ':',
            style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: (cabecera) ? FontWeight.bold : null),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      DataCell(
        Container(
          width: size.width * 0.18,
          child: Text(
            '$dineroTransformado',
            style: TextStyle(
                fontSize: size.width * 0.035,
                fontWeight: (cabecera) ? FontWeight.bold : null),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    ]);
  }
}
