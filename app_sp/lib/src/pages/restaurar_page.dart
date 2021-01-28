import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spi_salario/src/models/usuario_model.dart';
import 'package:spi_salario/src/providers/usuario_provider.dart';
import 'package:spi_salario/src/providers/usuarios_provider.dart';
import 'package:spi_salario/src/utils/utils.dart';

class ReataurarPage extends StatefulWidget {
  @override
  _RestaurarPageState createState() => _RestaurarPageState();
}

class _RestaurarPageState extends State<ReataurarPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //instanciar el modelo para guardar los datos del registro
  UsuarioModel usuario = new UsuarioModel();
  final usuarioProvider = new UsuarioProvider();
  // bool _hiddenpassword = true;
  // final TextEditingController _pass = TextEditingController();
  // final TextEditingController _confirmPass = TextEditingController();
  final usuariosProvider = new UsuariosProvider();
  // bool _guardando = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _crearFondoRegistro(context),
                  SizedBox(height: size.height * 0.05),
                  _registroForm(context),
                  SizedBox(height: size.height * 0.15),
                  _crearBotonLogin(context),
                ],
              ))),
    );
  }

  Widget _registroForm(BuildContext context) {
    //final blocRegistro = Provider.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // SafeArea(
          //   child: Container(
          //     height: size.height * 0.0,
          //   ),
          // ),
          Container(
            width: size.width * 0.8,
            margin: EdgeInsets.only(bottom: size.height * 0.01),
            padding: EdgeInsets.symmetric(vertical: 10.0),
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
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Restaurar',
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  'Contraseña',
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                    'Te enviaremos un enlace de restauración de tu contraseña, a la dirección de correo electrónico que especifique.',
                    textAlign: TextAlign.center),
                SizedBox(height: size.height * 0.02),
                _crearInputEmail(),
                SizedBox(height: size.height * 0.02),
                SizedBox(height: size.height * 0.02),
                _crearBotonRegistroForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearFondoRegistro(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _fondoMorado = Container(
      height: size.height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        //     gradient: LinearGradient(colors: <Color>[
        //   Color.fromRGBO(63, 63, 156, 1.0),
        //   Color.fromRGBO(90, 70, 178, 1.0)
        // ])
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
                SizedBox(height: size.height * 0.06),
                Image(
                  image: AssetImage("assets/images/logo_azul.png"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _crearInputEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.mail, color: Theme.of(context).primaryColor),
          hintText: 'example@example.com',
          labelText: 'Correo electrónico',
        ),
        onSaved: (value) => usuario.email = value,
        validator: (value) {
          RegExp mail = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
          if (value.isEmpty) {
            return "Este campo está vacío";
          }
          if (!(mail.hasMatch(value))) {
            return "Este correo no es válido";
          }
          return null;
        },
      ),
    );
  }

  Widget _crearBotonRegistroForm() {
    // return StreamBuilder(
    //     stream: bloc.nombreStream,
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 15.0),
        child: Text('Enviar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: () {
        _submit();
      },
    );
  }

  Widget _crearBotonLogin(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          '¿Recordó su contraseña? entre aquí',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login');
        },
      ),
    );
  }

  void _submit() async {
    //si el formulario no es válido
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    print(usuario.email);
    String dato = usuario.email;
    Map info = await usuarioProvider
        .restablecercontra(dato); //AQUI SE MANDA EL CORRREO

    if (info['ok']) {
      mostrarAlerta2(context,
          'Hemos enviado el enlace a su correo, si no aparece verificar en spam.');
    } else {
      //para mostrarla alerta
      if (info['mensaje'] == 'EMAIL_NOT_FOUND') {
        mostrarAlerta(context,
            'El correo especificado no pertenece a ningun usuario registrado, verifiqué el correo.');
      } else {
        mostrarAlerta(context,
            info['mensaje']); //por ci presenta otro error que no sea del correo
      }
    }
  }
}
