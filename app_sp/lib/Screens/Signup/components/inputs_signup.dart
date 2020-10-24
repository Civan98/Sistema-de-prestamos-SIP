import 'package:app_sp/components/text_field_container.dart';
import 'package:flutter/material.dart';

class inputsSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

//entrada para el nombre
  Widget inputName() {
    //expresión regular para validar la info introducida
    RegExp name =
        RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");
    return TextFieldContainer(
        child: TextFormField(
      decoration: InputDecoration(
        hintText: "Nombre",
        border: InputBorder.none,
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "Este campo está vacío";
        }
        if (!(name.hasMatch(value))) {
          return "El nombre no es correcto";
        }
        return null;
      },
    ));
  }

//entrada para apellidos
  Widget inputLastN() {
    RegExp name =
        RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");
    return TextFieldContainer(
        child: TextFormField(
      decoration: InputDecoration(
        hintText: "Apellidos",
        border: InputBorder.none,
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "Este campo está vacío";
        }
        if (!(name.hasMatch(value))) {
          return "Los apellidos no son correctos";
        }
        return null;
      },
    ));
  }

  //entrada para RFC
  Widget inputRFC() {
    RegExp rfc = RegExp(
        r"^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([A-Z\d]{3})?$");
    return TextFieldContainer(
        child: TextFormField(
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
          hintText: "RFC",
          border: InputBorder.none,
          icon: Icon(Icons.info_outline)),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "Este campo está vacío";
        }
        if ((!rfc.hasMatch(value))) {
          return "RFC no válido";
        }
        return null;
      },
    ));
  }

//entrada para el correo
  Widget inputMail() {
    RegExp mail = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return TextFieldContainer(
        child: TextFormField(
      decoration: InputDecoration(
        hintText: "Correo electrónico",
        border: InputBorder.none,
        icon: Icon(
          Icons.mail,
        ),
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "Este campo está vacío";
        }
        if (!(mail.hasMatch(value))) {
          return "Este correo no es válido";
        }
        return null;
      },
    ));
  }
}
