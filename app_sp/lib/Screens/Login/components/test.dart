import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_sp/components/text_field_container.dart';
//import 'package:firebase_storage/firebase_storage.dart';


class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference entidad = FirebaseFirestore.instance.collection('entidad financiera');

    return StreamBuilder<QuerySnapshot>(
      stream: entidad.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        

        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
          
        return Column(
          children: [
            new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                
                String stringValue = document.data()['Otorgado'].toString();//conversion de datos
                return new ListTile(
                  leading: Text(document.data()['Nombre']),
                  title: Text("$stringValue"),
                  
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
