import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:spi_salario/src/bloc/validators.dart';

//se debe usar rxdart para usar funciones reactivas
class LoginBloc with Validators {
  //rxdart no tiene StreamController por ello se usa BehaviorSubject
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //entradas del registro
  final _nombreController = BehaviorSubject<String>();

  //recuperar datos del stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);
  Stream<String> get nombreStream =>
      _passwordController.stream.transform(validarNombre);

  //streams del registro

  //validar ambos inputs email y pass, es decir, que ambos estén llenados correctamente
  //Observable es obsoleto, ahora sólo es rx.combineLatest
  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  //insertar valores al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeNombre => _nombreController.sink.add;

  //obtener último valor ingresado a los streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  //obtener último valor del registro
  String get nombre => _nombreController.value;

  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nombreController?.close();
  }
}
