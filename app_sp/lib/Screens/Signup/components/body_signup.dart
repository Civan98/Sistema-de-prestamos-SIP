import 'package:app_sp/Screens/Signup/components/inputs_signup.dart';
import 'package:app_sp/components/text_field_container.dart';
import 'package:app_sp/constants.dart';
import 'package:flutter/material.dart';
import 'package:app_sp/Screens/Login/login_screen.dart';
import 'package:app_sp/Screens/Signup/components/background_signup.dart';
import 'package:app_sp/Screens/Signup/components/or_divider.dart';
import 'package:app_sp/Screens/Signup/components/social_icon.dart';
import 'package:app_sp/components/already_have_an_account_acheck.dart';
import 'package:app_sp/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

class BodySignUp extends StatefulWidget {
  @override
  _BodySignUpState createState() => _BodySignUpState();
}

class _BodySignUpState extends State<BodySignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final inputs = new inputsSignUp();
  bool _hiddenpassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //background es una clase personalizada
    return BackgroundSignUp(
      inputs: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SafeArea(
              child: Text(
                "Registro",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: kPrimaryColor),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.30,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  inputs.inputName(),
                  inputs.inputLastN(),
                  inputs.inputRFC(),
                  inputs.inputMail(),
                  _inputPassword(),
                  _inputConfirmPassword(),
                  _buttonSend(),
                ],
              ),
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
            SizedBox(height: size.height * 0.04),
            //OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocalIcon(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/twitter.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/google-plus.svg",
            //       press: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return TextFieldContainer(
        child: TextFormField(
      controller: _pass,
      obscureText: _hiddenpassword,
      decoration: InputDecoration(
          hintText: "Contraseña",
          border: InputBorder.none,
          icon: Icon(Icons.lock),
          suffixIcon: IconButton(
              icon: Icon(_hiddenpassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye),
              onPressed: (() {
                setState(() {
                  _hiddenpassword = !_hiddenpassword;
                });
              }))),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "Este campo está vacío";
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
      decoration: InputDecoration(
          hintText: "Repetir contraseña",
          border: InputBorder.none,
          icon: Icon(Icons.lock),
          suffixIcon: IconButton(
              icon: Icon(_hiddenpassword
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye),
              onPressed: (() {
                setState(() {
                  _hiddenpassword = !_hiddenpassword;
                });
              }))),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "Este campo está vacío";
        }
        if (value != _pass.text) {
          return "La contraseñas no coinciden";
        }
        return null;
      },
    ));
  }

  Widget _buttonSend() {
    return RoundedButton(
      text: "Registrarme",
      press: () {
        if (_formKey.currentState.validate()) {
          print("Ok");
        }
      },
      color: kPrimaryColor,
      textColor: Colors.white,
    );
  }
}
