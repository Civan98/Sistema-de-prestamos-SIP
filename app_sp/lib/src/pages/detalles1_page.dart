import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spi_salario/src/models/entidades_model.dart';
import 'package:spi_salario/src/models/usuario_model.dart';
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:spi_salario/src/providers/entidades_provider.dart';
import 'package:spi_salario/src/providers/usuarios_provider.dart';
import 'package:intl/intl.dart';
import 'package:spi_salario/src/utils/menuLateral.dart';

class Detalles1Page extends StatefulWidget {
  @override
  _Detalles1PageState createState() => _Detalles1PageState();
}

class _Detalles1PageState extends State<Detalles1Page> {
  final transformarNumero = new NumberFormat.simpleCurrency();
  final entidadesProvider = new EntidadesProvider();
  final usuarioProvider = new UsuariosProvider();
  final prefs = new PreferenciasUsuario();
  double preReserva = 0.0;
  double capacidadActual = 0.0;
  double reserva = 0.0;
  double otorgado = 0.0;
  double saldodisponible = 0.0;
  int tamDataEntidades = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: menuLateral(context),
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/icons/logo.svg',
          width: size.width * 0.4,
        ),
        centerTitle: true,
      ),
      body: _cargarInfo(context),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   child: Icon(Icons.arrow_forward),
      //   onPressed: () {
      //     Navigator.pushNamed(context, 'detalles2');
      //   },
      // ),
    );
  }

  Widget _cargarInfo(BuildContext context) {
    // preReserva = 0.0;
    // reserva = 0.0;
    // otorgado = 0.0;
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
          //obtener el tamaño de un mapa en específico de la lista
          tamDataEntidades = snapshot.data[1].length;
          preReserva = 0.0;
          reserva = 0.0;
          otorgado = 0.0;
          saldodisponible = 0.0;

          for (var i = 0; i < tamDataEntidades; i++) {
            _calcularDatosFinancieros(context, datos[1][i], datos[0][0]);
          }
          saldodisponible = capacidadActual - (preReserva + reserva + otorgado);
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.02),
                   // _mostrarImagen(context),
                    SizedBox(height: size.height * 0.03),
                    _imprimirDatosIniciales(context, datos[0][0]),
                    Container(
                      //height: 200.0,
                      child: Column(children: <Widget>[
                        DataTable(
                            // showBottomBorder: false,
                            // showCheckboxColumn: false,
                            dividerThickness: 0.0,
                            dataRowHeight: 30.0,
                            columns: <DataColumn>[
                              DataColumn(
                                  label: Text('datos',
                                      style: TextStyle(
                                          color: Colors.transparent,
                                          fontSize: 0))),
                              DataColumn(
                                  label: Text('datos',
                                      style: TextStyle(
                                          color: Colors.transparent))),
                              DataColumn(
                                  label: Text('datos',
                                      style: TextStyle(
                                          color: Colors.transparent))),
                            ],
                            // ignore: missing_return
                            rows: [
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Container(
                                    width: size.width * 0.3,
                                    child: Text(
                                      'Pre-reserva',
                                      style: TextStyle(
                                          fontSize: size.width * 0.035),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    width: size.width * 0.1,
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: size.width * 0.035),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    width: size.width * 0.17,
                                    child: Text(
                                      '${transformarNumero.format(preReserva)}',
                                      style: TextStyle(
                                          fontSize: size.width * 0.035),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Container(
                                    width: size.width * 0.3,
                                    child: Text(
                                      'Reserva',
                                      style: TextStyle(
                                          fontSize: size.width * 0.035),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    width: size.width * 0.1,
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: size.width * 0.035),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    width: size.width * 0.17,
                                    child: Text(
                                      '${transformarNumero.format(reserva)}',
                                      style: TextStyle(
                                          fontSize: size.width * 0.035),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ]),
                              DataRow(cells: <DataCell>[
                                DataCell(
                                  Container(
                                    width: size.width * 0.3,
                                    child: Text(
                                      'Otorgado',
                                      style: TextStyle(
                                          fontSize: size.width * 0.035),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    width: size.width * 0.1,
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                          fontSize: size.width * 0.035),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    width: size.width * 0.17,
                                    child: Text(
                                      '${transformarNumero.format(otorgado)}',
                                      style: TextStyle(
                                          fontSize: size.width * 0.035),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                              ])
                            ]),
                        Column(
                          children: [
                            SizedBox(height: size.height * 0.1),
                            Text(
                              'Saldo Disponible:  ${transformarNumero.format(saldodisponible)}',
                              style: TextStyle(fontSize: size.width * 0.06),
                            )
                          ],
                        )
                      ]),

                      //_datosFinancieros(context),
                    ),
                  ]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _mostrarImagen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        child: Center(
            child: Image(
      image: AssetImage('assets/images/no-image.png'),
      width: size.width * 0.5,
      height: size.height * 0.2,
    )));
  }

  Widget _imprimirDatosIniciales(
      BuildContext context, UsuarioModel datoUsuario) {
    final size = MediaQuery.of(context).size;
    capacidadActual = datoUsuario.capacidadactual;
    //saldodisponible = datoUsuario.saldodisponible;
    return Column(
      children: [
        Text(
          '${datoUsuario.nombre} ${datoUsuario.apellidos}',
          style: TextStyle(fontSize: size.width * 0.06),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.01),
        Text('Dependencia: Secretaria de Educación Publica',
          style: TextStyle(fontSize: size.width *0.06), textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.01,),
        Text(
          'RFC: ${datoUsuario.rfc}',
          style: TextStyle(color: Colors.black45, fontSize: size.width * 0.05),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: size.height * 0.03),
        Text(
          'Capacidad Actual:          ${transformarNumero.format(datoUsuario.capacidadactual)}',
          style: TextStyle(fontSize: size.width * 0.05),
          textAlign: TextAlign.center,
        ),
        //SizedBox(height: size.height * 0.02),
      ],
    );
  }

  void _calcularDatosFinancieros(
      BuildContext context, EntidadModel datoEntidades, UsuarioModel usuario) {
    capacidadActual = usuario.capacidadactual;
    if (datoEntidades.status == 'Pre-reserva') {
      preReserva += datoEntidades.montoqnal;
      //print(preReserva);
    }
    if (datoEntidades.status == 'Reserva') {
      reserva += datoEntidades.montoqnal;
      //print(reserva);
    }
    if (datoEntidades.status == 'Otorgado') {
      otorgado += datoEntidades.montoqnal;
      // print(otorgado);
    }
  }

  // DataRow _crearCeldas(context, EntidadModel datos) {
  //   final size = MediaQuery.of(context).size;
  //   DataRow celda;
  //   if (datos.status == 'Pre-reserva') {
  //     celda = DataRow(cells: <DataCell>[
  //       DataCell(
  //         Container(
  //           width: size.width * 0.15,
  //           child: Text(
  //             'Pre-reserva',
  //             style: TextStyle(fontSize: size.width * 0.035),
  //           ),
  //         ),
  //       ),
  //       DataCell(
  //         Container(
  //           width: size.width * 0.18,
  //           child: Text(
  //             '${transformarNumero.format(preReserva)}',
  //             style: TextStyle(fontSize: size.width * 0.035),
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //       ),
  //     ]);
  //   }
  //   if (datos.status == 'Reserva') {
  //     celda = DataRow(cells: <DataCell>[
  //       DataCell(
  //         Container(
  //           width: size.width * 0.15,
  //           child: Text(
  //             'Reserva',
  //             style: TextStyle(fontSize: size.width * 0.035),
  //           ),
  //         ),
  //       ),
  //       DataCell(
  //         Container(
  //           width: size.width * 0.18,
  //           child: Text(
  //             '${transformarNumero.format(preReserva)}',
  //             style: TextStyle(fontSize: size.width * 0.035),
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //       ),
  //     ]);
  //   }
  //   if (datos.status == 'Otorgado') {
  //     celda = DataRow(cells: <DataCell>[
  //       DataCell(
  //         Container(
  //           width: size.width * 0.15,
  //           child: Text(
  //             'Pre-reserva',
  //             style: TextStyle(fontSize: size.width * 0.035),
  //           ),
  //         ),
  //       ),
  //       DataCell(
  //         Container(
  //           width: size.width * 0.18,
  //           child: Text(
  //             '${transformarNumero.format(preReserva)}',
  //             style: TextStyle(fontSize: size.width * 0.035),
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //       ),
  //     ]);
  //   }
  //   return celda;
  // }

//   Widget _datosFinancieros(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Column(
//       children: <Widget>[
//         Text(
//           'Pre-reserva',
//           style: TextStyle(fontSize: size.width * 0.06),
//         ),
//         SizedBox(height: size.height * 0.02),
//       ],
//     );
//   }
}
