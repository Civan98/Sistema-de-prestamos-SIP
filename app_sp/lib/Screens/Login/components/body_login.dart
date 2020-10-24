import 'package:app_sp/components/text_field_container.dart';
import 'package:app_sp/constants.dart';
import 'package:app_sp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:app_sp/Screens/Login/components/background_login.dart';
import 'package:app_sp/Screens/Signup/signup_screen.dart';
import 'package:app_sp/components/already_have_an_account_acheck.dart';
import 'package:app_sp/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BodyLogin extends StatefulWidget {
  const BodyLogin({
    Key key,
  }) : super(key: key);

  @override
  _BodyLoginState createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _hiddenpassword = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackgroundLogin(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SafeArea(
              child: Text(
                "Iniciar sesión",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: kPrimaryColor),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.30,
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
          controller: emailController,
      decoration: InputDecoration(
        hintText: "Correo electrónico",
        border: InputBorder.none,
        icon: Icon(
          Icons.account_circle,
        ),
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          return "Campo vacío";
        }
        return null;
      },
    ));
  }

  Widget _inputPassword() {
    return TextFieldContainer(
        child: TextFormField(
          controller: passwordController,
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
          return "Campo vacío";
        }
        return null;
      },
    ));
  }

  Widget _buttonSend() {
    return RoundedButton(
      text: "Entrar",
      press: () {
        if (_formKey.currentState.validate()) {
                        context.read<AuthenticationService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
        }
      },
      color: kPrimaryColor,
      textColor: Colors.white,
    );
  }
}
