import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_sp/components/text_field_container.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference entidad =
        FirebaseFirestore.instance.collection('entidad financiera');

    return StreamBuilder<QuerySnapshot>(
      stream: entidad.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Stack(
          //para listar dos widget, para que no se repita el titulo de arriba de la tabla uso dos tablas
          children: <Widget>[
            DataTable(
              columns: <DataColumn>[
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
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text("")),
                    DataCell(Text("")),
                    DataCell(Text("")),
                  ],
                ),
              ],
            ),
            ListView(
              //en este list se enlista la tabla con datos de firebase

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
            )
          ],
        );

        /* return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            String stringValue = document.data()['Otorgado'].toString(); //conversion de datos
            return new ListTile(
              leading: Text(document.data()['Nombre']),
              title: Text("$stringValue"),
            );
          }).toList(),
        );*/
      },
    );
  }
}
