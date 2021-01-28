import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spi_salario/src/models/entidades_model.dart';
import 'package:spi_salario/src/models/usuario_model.dart';
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:spi_salario/src/providers/entidades_provider.dart';
import 'package:spi_salario/src/providers/usuarios_provider.dart';
import 'package:intl/intl.dart';
import 'package:spi_salario/src/utils/menuLateral.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final transformarNumero = new NumberFormat.simpleCurrency();

  final entidadesProvider = new EntidadesProvider();

  final usuarioProvider = new UsuariosProvider();

  final prefs = new PreferenciasUsuario();

  double saldo = 0;

  double saldoTemp = 0;

  double saldoDisponible = 0;

  int tamDatosEntidades = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: menuLateral(context),
      appBar: AppBar(
        // leading: Builder(
        //   //se rellena el leading con algo, para que no se buge
        //   builder: (BuildContext context) {
        //     return Text('');
        //   },
        // ),
        title: Container(
          //margin: EdgeInsets.only(left: size.width * 0.05),
          child: Image(
            image: AssetImage("assets/images/logo_azul.png"),
            width: size.width * 0.4,
          ),
        ),
        centerTitle: true,
      ),
      body: _informacion(context),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   onPressed: () {
      //     Navigator.pushNamed(context, 'detalles1');
      //   },
      //   child: Icon(Icons.arrow_forward),
      // ),
    );
  }

  Widget _informacion(BuildContext context) {
    final String idu =
        prefs.iduser; //obtiene el id de los valores de preferencia
    final String newValue = idu.replaceAll(
        " ", ""); // borra el el primer espacio en blanco de la cadena
    //print(newValue);

    return FutureBuilder(
      //para llamar varias future functions, notar que se cambió el tipo de lista en el AsyncSnapshot
      future: Future.wait([
        usuarioProvider.obtenerUsuario(
            '$newValue'), //se obtiene el ID de la preferencias del usuario
        entidadesProvider.cargarEntidades('$newValue')
      ]),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        final datos = snapshot.data;
        saldo = 0;
        saldoDisponible = 0;
        saldoTemp = 0;
        final size = MediaQuery.of(context).size;
        if (snapshot.hasData) {
          tamDatosEntidades = snapshot.data[1].length;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.02),
                //_mostrarImagen(context),
                SizedBox(height: size.height * 0.03),
                _imprimirDatosIniciales(context, datos[0][0]),
                //se envía la posición de la lista de las funciones future, y a continuación el mapa
                Container(
                  //height: size.height,
                  child: Column(children: <Widget>[
                    DataTable(
                      columns: <DataColumn>[
                        DataColumn(label: Text('Entidad')),
                        DataColumn(label: Text('Saldo')),
                        DataColumn(
                            label: Text('QnasRestantes',
                                textAlign: TextAlign.left)),
                      ],
                      rows: List.generate(tamDatosEntidades,
                          (index) => _crearCeldas(context, datos[1][index])),
                      //generar las celdas, se envía el tamaño de la lista (entidades)
                    ),
                  ]),
                ),
                _imprimirDatosFinales(context, datos[0][0]),
              ],
            ),
          );
          // return ListView.builder(
          //   itemCount: entidades.length,
          //   itemBuilder: (context, i) => _crearItems(entidades[i]),
          // );
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

  DataRow _crearCeldas(BuildContext context, EntidadModel datoEntidades) {
    final size = MediaQuery.of(context).size;
    saldo += datoEntidades.saldo;
    saldoTemp += datoEntidades.montoqnal;
    return DataRow(cells: <DataCell>[
      DataCell(
        Container(
            width: size.width * 0.19,
            child: TextButton(
              child: Text(
                '${datoEntidades.nombre}',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'detallesPrestamo');
              },
            )
            //Text(
            //   '${datoEntidades.nombre}',
            //   style: TextStyle(fontSize: size.width * 0.035),
            // ),
            ),
      ),
      DataCell(
        Container(
          width: size.width * 0.18,
          child: Text(
            '${transformarNumero.format(datoEntidades.saldo)}',
            style: TextStyle(fontSize: size.width * 0.035),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      DataCell(
        Container(
            width: double.infinity,
            child: Center(
              child: Text(
                '${datoEntidades.qnasrestante}',
                style: TextStyle(fontSize: size.width * 0.035),
              ),
            )),
      ),
    ]);
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
        Text(
          'Dependencia: Secretaria de Educación Publica',
          style: TextStyle(fontSize: size.width * 0.06),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          'RFC: ${datoUsuario.rfc}',
          style: TextStyle(color: Colors.black45, fontSize: size.width * 0.05),
        ),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }

  Widget _imprimirDatosFinales(BuildContext context, UsuarioModel datoUsuario) {
    final size = MediaQuery.of(context).size;
    saldoDisponible = datoUsuario.capacidadactual - saldoTemp;
    return Column(
      children: [
        SizedBox(height: size.height * 0.02),
        Text(
          'Saldo: ${transformarNumero.format(saldo)}',
          style: TextStyle(fontSize: size.width * 0.06),
        ),
        SizedBox(height: size.height * 0.02),
        Text(
          'Saldo Disponible:  ${transformarNumero.format(saldoDisponible)}',
          style: TextStyle(fontSize: size.width * 0.06),
        )
      ],
    );
  }

  // Widget _crearItems(EntidadModel entidad) {
  //   return ListTile(
  //     title: Text(
  //         '${entidad.nombre}  ${entidad.status} ${entidad.importe} ${entidad.qnasrestante}'),
  //     subtitle: Text(
  //         '${entidad.cuotas}     ${entidad.saldo}       ${entidad.solicitud}'),
  //   );
  // }
}
