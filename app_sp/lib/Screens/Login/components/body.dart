import 'package:app_sp/components/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:app_sp/Screens/Login/components/background.dart';
import 'package:app_sp/Screens/Signup/signup_screen.dart';
import 'package:app_sp/components/already_have_an_account_acheck.dart';
import 'package:app_sp/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String _password="";
  String _email="";
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
              "INICIAR SESIÓN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _inputMail(),
                  _inputPassword(),
                  _buttonSend(),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget _inputMail() {
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
        return null;
      },
    ));
  }

 Widget _inputPassword() {
    return TextFieldContainer(
        child: TextFormField(
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

  Widget _buttonSend()
  {
   return RoundedButton(
                    text: "Entrar",
                    press: () {
                      if (_formKey.currentState.validate()) {
                        print("Ok");
                      }
                    },
                  );
  }
}
