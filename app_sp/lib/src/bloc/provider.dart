import 'package:flutter/material.dart';
import 'package:spi_salario/src/bloc/login_bloc.dart';
//se exporta para poder usar el login_bloc en otras partes
export 'package:spi_salario/src/bloc/login_bloc.dart';

//el inherited widget nos permite obtener datos de todo el arbol de widgets
class Provider extends InheritedWidget {
  //para no perder valores al hacer un hotreload-----------------
  static Provider _instancia;
  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }
  Provider._internal({Key key, Widget child}) : super(key: key, child: child);
//-------------------------------------------------------
  final loginBloc = LoginBloc();
  // Provider({Key key, Widget child}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
  static LoginBloc of(BuildContext context) {
    //esta es la nueva forma de usar inheritedwidget
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).loginBloc;
  }
}
