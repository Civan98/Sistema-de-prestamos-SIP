import 'package:app_sp/Screens/Login/components/read_data.dart';
import 'package:flutter/material.dart';
import 'package:app_sp/Screens/PrincipalPage/components/body_principal.dart';
import 'package:app_sp/Screens/Login/components/test.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BodyPrincipal(),
      //body: GetUserName('1'),//aqui manda a traer el principal en el argumento debe ir el ID del usuario
        body: BodyPrincipal(),
    );
  }
}
