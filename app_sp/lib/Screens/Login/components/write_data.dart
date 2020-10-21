import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String nombre;
  final String apellidos;
  final String rfc;

  AddUser(this.nombre, this.apellidos, this.rfc);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    Firebase.initializeApp();
    CollectionReference users = FirebaseFirestore.instance.collection('usuarios');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'nombre': nombre, 
            'apellidos': apellidos, 
            'rfc': rfc 
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return FlatButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}