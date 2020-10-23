import 'package:app_sp/Screens/PrincipalPage/principalpage.dart';
import 'package:flutter/material.dart';
import 'package:app_sp/Screens/Login/login_screen.dart';
import 'package:app_sp/Screens/Signup/signup_screen.dart';
import 'package:app_sp/Screens/Welcome/components/background.dart';
import 'package:app_sp/components/rounded_button.dart';
import 'package:app_sp/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "INICIAR SESIÓN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                     /* return LoginScreen(); */
                     return PrincipalPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "REGISTRARSE",
              color: kPrimaryLightColor,
              textColor: Colors.black,
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
}
