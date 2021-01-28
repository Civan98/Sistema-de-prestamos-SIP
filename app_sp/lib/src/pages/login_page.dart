import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spi_salario/src/bloc/provider.dart';
import 'package:spi_salario/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:spi_salario/src/providers/usuario_provider.dart';
import 'package:spi_salario/src/providers/usuarios_provider.dart';
import 'package:spi_salario/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioProvider = new UsuarioProvider();

  final prefs = new PreferenciasUsuario();

  final usuariosProvider = new UsuariosProvider();

  bool noIniciando = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: size.height * 0.2,
          )),
          Container(
            width: size.width * 0.8,
            //height: size.height * 0.6,
            margin: EdgeInsets.symmetric(vertical: 5.0),
            padding: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ],
            ), //inputs
            child: Column(
              children: <Widget>[
                Text(
                  'Iniciar sesión',
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(height: 60.0),
                _crearEmail(bloc),
                SizedBox(height: 30.0),
                _crearPassword(bloc),
                SizedBox(height: 30.0),
                _crearBoton(bloc)
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Text('¿No estás registrado?'),
          SizedBox(height: 10.0),
          _crearBotonRegistro(context),
          SizedBox(height: 10.0),
          _crearBotonRestaurar(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white
          // gradient: LinearGradient(colors: <Color>[
          //   Color.fromRGBO(0, 0, 255, 1),
          //   Color.fromRGBO(0, 0, 255, 1)
          // ]),
          ),
    );
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.08),
      ),
    );

    return Stack(
      children: <Widget>[
        _fondoMorado,
        Positioned(
          top: 90.0,
          left: 30.0,
          child: circulo,
        ),
        Positioned(
          top: -40.0,
          right: -30.0,
          child: circulo,
        ),
        Positioned(
          bottom: -50.0,
          right: -10.0,
          child: circulo,
        ),
        Positioned(
          bottom: 120.0,
          right: 20.0,
          child: circulo,
        ),
        Positioned(
          bottom: -50.0,
          left: -20.0,
          child: circulo,
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
                  child: Image(
                    image:
                        AssetImage("assets/images/sp-salario_background.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _crearEmail(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: Icon(Icons.alternate_email,
                      color: Theme.of(context).primaryColor),
                  hintText: 'ejemplo@correo.com',
                  labelText: 'Correo electrónico',
                  //counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outlined,
                      color: Theme.of(context).primaryColor),
                  hintText: 'ejemplo@correo.com',
                  labelText: 'Contraseña',
                  //counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: bloc.changePassword,
            ),
          );
        });
  }

  Widget _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
              child: Text('Ingresar'),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: (noIniciando && snapshot.hasData)
                ? () => _login(bloc, context)
                : null,
          );
        });
  }

  Widget _crearBotonRestaurar(BuildContext context) {
    return TextButton(
      child: Text(
        '¿Olvidó su contraseña? Ingrese aquí',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'restaurar');
      },
    );
  }

  Widget _crearBotonRegistro(BuildContext context) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
        child: Text('Registrate'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pushReplacementNamed(context, 'registro');
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {
    Map info = await usuarioProvider.login(bloc.email, bloc.password);
    setState(() {
      noIniciando = false;
    });

    if (info['ok']) {
      setState(() {
        noIniciando = false;
      });
      //print(prefs.email);
      //manda a traer la pantalla de carga para asignar los datos
      Navigator.pushReplacementNamed(context, 'carga');
    } else {
      //para mostrarla alerta
      mostrarAlerta(context, info['mensaje']);
    }
    setState(() {
      noIniciando = true;
    });
  }
}
