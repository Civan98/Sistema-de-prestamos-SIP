//validar los inputs
import 'dart:async';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no válido');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Utilice una contraseña de más de 6 caracteres');
    }
  });
  //validar info del registro
  final validarNombre = StreamTransformer<String, String>.fromHandlers(
      handleData: (nombre, sink) {
    if (nombre.length >= 2) {
      sink.add(nombre);
    } else {
      sink.addError('Nombre inválido');
    }
  });
}
