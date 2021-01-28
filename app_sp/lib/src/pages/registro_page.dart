import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spi_salario/src/models/usuario_model.dart';
import 'package:spi_salario/src/providers/usuarios_provider.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //instanciar el modelo para guardar los datos del registro
  UsuarioModel usuario = new UsuarioModel();
  bool _hiddenpassword = true;
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final usuariosProvider = new UsuariosProvider();
  bool _guardando = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _crearFondoRegistro(context),
                  _registroForm(context),
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
              children: <Widget>[
                Text(
                  'Registrar usuario',
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                _crearInputRFC(),
                SizedBox(height: size.height * 0.02),
                _crearBotonBuscarRFC(),
                SizedBox(height: size.height * 0.02),
                _crearInputNombre(),
                SizedBox(height: size.height * 0.02),
                _crearInputApellidos(),
                SizedBox(height: size.height * 0.02),
                _crearInputDependencia(),
                SizedBox(height: size.height * 0.02),
                _crearInputEmail(),
                SizedBox(height: size.height * 0.02),
                _crearInputPassword(),
                SizedBox(height: size.height * 0.02),
                _crearInputConfirmPassword(),
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

  Widget _crearInputNombre() {
    // return StreamBuilder(
    //     stream: blocRegistro.nombreStream,
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon:
              Icon(Icons.account_circle, color: Theme.of(context).primaryColor),
          hintText: 'Nombre(s)',
          labelText: 'Nombre(s)',
          // counterText: snapshot.data,
          // errorText: snapshot.error
        ),
        //guardar los datos en el modelo, value contiene el dato del input
        onSaved: (value) => usuario.nombre = value,
        //onChanged: blocRegistro.changeNombre,
        validator: (value) {
          if (value.length < 3) {
            return 'Ingrese un nombre válido';
          } else {
            return null;
          }
        },
      ),
    );
    // });
  }

  Widget _crearInputDependencia() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(Icons.account_balance_rounded,
              color: Theme.of(context).primaryColor),
          hintText: 'Dependencia',
          labelText: 'Dependencia',
        ),
        onSaved: (value) => usuario.apellidos = value,
        validator: (value) {
          if (value.length < 3) {
            return 'Ingrese una dependencia valida';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _crearInputApellidos() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon:
              Icon(Icons.account_circle, color: Theme.of(context).primaryColor),
          hintText: 'Apellidos',
          labelText: 'Apellidos',
        ),
        onSaved: (value) => usuario.apellidos = value,
        validator: (value) {
          if (value.length < 10) {
            return 'Ingrese apellidos válidos';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _crearInputRFC() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.characters,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(Icons.info_sharp, color: Theme.of(context).primaryColor),
          hintText: 'Incerte su RFC',
          labelText: 'RFC',
        ),
        onSaved: (value) => usuario.rfc = value,
        validator: (value) {
          RegExp rfc = RegExp(
              r"^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([A-Z\d]{3})?$");
          if (value.isEmpty) {
            return "Este campo está vacío";
          }
          if ((!rfc.hasMatch(value))) {
            return "RFC no válido";
          }
          return null;
        },
      ),
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

  Widget _crearInputPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: _pass,
        keyboardType: TextInputType.text,
        obscureText: _hiddenpassword,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
          suffixIcon: IconButton(
              icon: Icon(_hiddenpassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye),
              onPressed: (() {
                setState(() {
                  _hiddenpassword = !_hiddenpassword;
                });
              })),
          hintText: 'Cree una ontraseña',
          labelText: 'Contraseña',
        ),
        onSaved: (value) => usuario.password = value,
        validator: (value) {
          if (value.isEmpty) {
            return "Este campo está vacío";
          }
          return null;
        },
      ),
    );
  }

  Widget _crearInputConfirmPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: _confirmPass,
        keyboardType: TextInputType.text,
        obscureText: _hiddenpassword,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
          suffixIcon: IconButton(
              icon: Icon(_hiddenpassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye),
              onPressed: (() {
                setState(() {
                  _hiddenpassword = !_hiddenpassword;
                });
              })),
          hintText: 'Confirme su contraseña',
          labelText: 'Confirmar Contraseña',
        ),
        onSaved: (value) => usuario.password = value,
        validator: (value) {
          if (value.isEmpty) {
            return "Este campo está vacío";
          }
          if (value != _pass.text) {
            return "La contraseñas no coinciden";
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
        child: Text('Registrar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: (_guardando) ? null : _submit,
      // () {
      //   // Navigator.pushReplacementNamed(context, 'home');
      //   // print('Nombre: ${bloc.nombre}');
      // },
    );
    // });
  }

  Widget _crearBotonBuscarRFC() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        child: Text('Buscar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      onPressed: () {},
    );
  }

  Widget _crearBotonLogin(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          '¿Ya tiene un usuario?, entre aquí',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'login');
        },
      ),
    );
  }

  void _submit() {
    //si el formulario no es válido
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    // print('${usuario.nombre} ${usuario.apellidos}');
    // print(usuario.email);
    // print(usuario.rfc);
    // print(usuario.password);
    //bool registro = false;

    //evitar que el botón de guardar se active cuando se guarda
    setState(() {
      _guardando = true;
    });

    usuariosProvider.registrarUsuario(usuario).then((value) {
      //print(value.toString());
      if (value) {
        setState(() {
          _guardando = false;
        });
        mostrarSnackBar('Usuario registrado ');

        Navigator.pushReplacementNamed(context, 'login');
      } else {
        setState(() {
          _guardando = false;
        });
        mostrarSnackBar('Ya hay un usuario con su rfc o correo');
      }
    });

    // if () {}
  }

  void mostrarSnackBar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 2000),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
