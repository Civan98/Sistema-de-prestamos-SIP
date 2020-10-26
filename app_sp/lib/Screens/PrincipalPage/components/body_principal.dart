import 'package:app_sp/Screens/PrincipalPage/components/background_principal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyPrincipal extends StatefulWidget {
  const BodyPrincipal({
    Key key,
  }) : super(key: key);

  @override
  _BodyPrincipalState createState() => _BodyPrincipalState();
}

class _BodyPrincipalState extends State<BodyPrincipal> {
  final _formKey = GlobalKey<FormState>();
  bool _hiddenpassword = true;
      String documentId = "1";
  CollectionReference entidad =
      FirebaseFirestore.instance.collection('entidad financiera');
  CollectionReference users = FirebaseFirestore.instance.collection('usuarios');
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    Size size = MediaQuery.of(context).size;
    return BackgroundPrincipal(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/logo.svg",
              height: size.height * 0.10,
            ),
            Image.network(
              "https://firebasestorage.googleapis.com/v0/b/spi-salario.appspot.com/o/fotos%20de%20usuarios%2Fluis_miguel.png?alt=media&token=23501f6f-2313-4983-97a1-8072ef73598d",
              width: size.height * 0.35,
              loadingBuilder: (context, child, progress) {
                return progress == null ? child : LinearProgressIndicator();
              },
            ),
            _usuario(),
            SizedBox(
              height: 20.0,
            ),
            _stremData(),

            /* _dataTable(),*/
            Text(
              "Saldo: 56,900",
              style: TextStyle(fontSize: 26),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Saldo Disponible:1,500",
              style: TextStyle(fontSize: 26),
            ),
            /*Aquí va en contenido*/

            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }

  _stremData() {
    return StreamBuilder<QuerySnapshot>(
        stream: entidad.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 1.0),
                        child: DataTable(
                          rows: [],
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Entidad',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Saldo',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Qnas restantes',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Column(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    String Otorgado = document
                        .data()['Otorgado']
                        .toString(); //conversion de dato otorgado de int a string
                    String Qnas_restantes =
                        document.data()['Qnas restantes'].toString();
                    return DataTable(
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text(
                            '',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(document.data()['Nombre'])),
                            DataCell(Text("$Otorgado")),
                            DataCell(Text("$Qnas_restantes")),
                          ],
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        });
  }

  _usuario() {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return BackgroundPrincipal(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  Text("Nombre: ${data['nombre']}",
                      style: TextStyle(fontSize: 26)),
                  Center(
                      child: Text(
                    "${data['apellidos']}",
                    style: TextStyle(fontSize: 26),
                  )),
                  Text(
                    "RFC: ${data['rfc']}",
                    style: TextStyle(fontSize: 26),
                  ),
                ],
              ),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 10, //tama;o del circulo
            backgroundColor: Colors.grey,
          ), //loading
        );
      },
    );
  }

  Widget _dataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Entidad',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Saldo',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Qnas restantes',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Caja libertad')),
              DataCell(Text('35,200')),
              DataCell(Text('43')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Inbursa')),
              DataCell(Text('15,400')),
              DataCell(Text('32')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Credito Maestro')),
              DataCell(Text('6,300')),
              DataCell(Text('18')),
            ],
          ),
        ],
      ),
    );
  }
}
