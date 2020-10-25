import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:app_sp/Screens/PrincipalPage/components/background_principal.dart';
import 'package:flutter_svg/svg.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Firebase.initializeApp();
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/logo.svg",
                    height: size.height * 0.35,
                  ),
                  Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/spi-salario.appspot.com/o/fotos%20de%20usuarios%2Fluis_miguel.png?alt=media&token=23501f6f-2313-4983-97a1-8072ef73598d",
                    width: size.height * 0.35,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : LinearProgressIndicator();
                    },
                  ),
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
                  _dataTable(context),
                  Text(
                    "Saldo: 56,900",
                    style: TextStyle(fontSize: 26),
                  ),
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

        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 10, //tama;o del circulo
            backgroundColor: Colors.grey,
          ), //loading
        );
      },
    );
  }
}

Widget _dataTable(BuildContext context) {
  //aqui debe ir lo que retorna test.dar la tabal con diseño
  Size size = MediaQuery.of(context).size;

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
            'Qgynas restantes',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text("srgsg")),
            DataCell(Text("grgdrg")),
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

  return Center(
    child: CircularProgressIndicator(), //loading
  );
}
