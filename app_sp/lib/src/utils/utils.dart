import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
      title: Text('Información incorrecta', textAlign: TextAlign.center,),
      content: Text(mensaje,textAlign:  TextAlign.justify,),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: ()=> Navigator.of(context).pop(),
        )
      ]
        );
      });
}

void mostrarAlerta2(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
      title: Text('Correo enviado', textAlign: TextAlign.center,),
      content: Text(mensaje, textAlign:  TextAlign.justify,),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),//despues de mandar el correo lo mando al login
          onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),
        )
      ]
        );
      });
}

