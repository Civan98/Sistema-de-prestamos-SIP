import 'package:app_sp/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:app_sp/Screens/Login/login_screen.dart';
import 'package:app_sp/Screens/Signup/components/background.dart';
import 'package:app_sp/Screens/Signup/components/or_divider.dart';
import 'package:app_sp/Screens/Signup/components/social_icon.dart';
import 'package:app_sp/components/already_have_an_account_acheck.dart';
import 'package:app_sp/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _pass = TextEditingController();
    final TextEditingController _confirmPass = TextEditingController();

  bool _hiddenpassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Registro",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            Form(key: _formKey,
            child:Column(
              children: <Widget>[
            _inputName(),
            _inputLastN(),
            _inputRFC(),
            _inputMail(),
            _inputPassword(),
            _inputConfirmPassword(),
            _buttonSend(),
              ],
            ) ,
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

    Widget _inputMail() {
   RegExp mail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return TextFieldContainer(
        child: TextFormField(
      decoration:
          InputDecoration(
            hintText: "Tú correo",
            border: InputBorder.none,
            icon: Icon(Icons.account_circle,),),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "No puede estar vacio!";
        }
        if(!(mail.hasMatch(value)))
        {
          return "Este correo no es valido!";
        }
        return null;
      },
    ));
  }
    Widget _inputName() {
      RegExp name = RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");
    return TextFieldContainer(
        child: TextFormField(
      decoration:
          InputDecoration(
            hintText: "Nombre",
            border: InputBorder.none,
            icon: Icon(Icons.account_circle),),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "No puede estar vacio!";
        }
        if(!(name.hasMatch(value)))
        {
          return "El nombre no esta bien!";
        }
        return null;
      },
    ));
  }

 Widget _inputLastN() {
      RegExp name = RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");
    return TextFieldContainer(
        child: TextFormField(
      decoration:
          InputDecoration(
            hintText: "Apellidos",
            border: InputBorder.none,
            icon: Icon(Icons.account_circle),),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "No puede estar vacio!";
        }
        if(!(name.hasMatch(value)))
        {
          return "Los apellidos no estan bien!";
        }
        return null;
      },
    ));
  }

 Widget _inputPassword() {
    return TextFieldContainer(
        child: TextFormField(
          controller: _pass,
      obscureText: _hiddenpassword,
      decoration:
          InputDecoration(
          hintText: "Tú contraseña",
          border: InputBorder.none,
          icon: IconButton(
            icon: Icon(_hiddenpassword?Icons.lock:Icons.remove_red_eye), onPressed: (
              (){
                setState(() {
                  _hiddenpassword = !_hiddenpassword;
                });
              }
              ))),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "No puede estar vacio!";
        }
        return null;
      },
    ));
  }
  Widget _inputConfirmPassword() {
    return TextFieldContainer(
        child: TextFormField(
          controller: _confirmPass,
      obscureText: _hiddenpassword,
      decoration:
          InputDecoration(
          hintText: "Tú contraseña",
          border: InputBorder.none,
          icon: IconButton(
            icon: Icon(_hiddenpassword?Icons.lock:Icons.remove_red_eye), onPressed: (
              (){
                setState(() {
                  _hiddenpassword = !_hiddenpassword;
                });
              }
              ))),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) 
        {
          return "No puede estar vacio!";
        }
        if(value != _pass.text)
        {
          return "La contraseñas no coinciden";
        }
        return null;
      },
    ));
  }
Widget _inputRFC() {
  RegExp rfc = RegExp(r"^([A-ZÑ\x26]{3,4}([0-9]{2})(0[1-9]|1[0-2])(0[1-9]|1[0-9]|2[0-9]|3[0-1]))([A-Z\d]{3})?$");
    return TextFieldContainer(
        child: TextFormField(
      textCapitalization: TextCapitalization.characters,
      decoration:
          InputDecoration(
          hintText: "RFC",
          border: InputBorder.none,
          icon:Icon(Icons.account_tree_rounded) ),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "No puede estar vacio!";
        }
        if((!rfc.hasMatch(value)))
        {
          return "RFC no valido";
        }
        return null;
      },
    ));
  }

  Widget _buttonSend()
  {
   return RoundedButton(
                    text: "Registrarme",
                    press: () {
                      if (_formKey.currentState.validate()) {
                        print("Ok");
                      }
                    },
                  );
  }
}
