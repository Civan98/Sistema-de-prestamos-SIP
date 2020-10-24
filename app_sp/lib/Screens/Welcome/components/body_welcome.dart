import 'package:app_sp/Screens/PrincipalPage/principalpage.dart';
import 'package:flutter/material.dart';
//import 'package:app_sp/Screens/Login/login_screen.dart';
import 'package:app_sp/Screens/Signup/signup_screen.dart';
import 'package:app_sp/Screens/Welcome/components/background_welcome.dart';
import 'package:app_sp/components/rounded_button.dart';
import 'package:app_sp/constants.dart';
import 'package:flutter_svg/svg.dart';

class BodyWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //para controlar los tamaños de los componentes por proporciones
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return BackgroundWelcome(
      //por si la pantalla es pequeña, permita hacer scroll para mostrar toda la información
      backgroundWelcome: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: size.height * 0.15),
            SvgPicture.asset(
              "assets/icons/logo.svg",
              //el error que salía de que el formato para una imagen svg era porque en la imagen en el
              //width y height tenían pt en lugar de px
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            //RoundedButton es una función (personalizada) que permite dibujar los botones
            //sólo se mandan los valores de text y press
            RoundedButton(
              text: "INICIAR SESIÓN",
              //falta reparar la navegación
              color: kPrimaryColor,
              textColor: Colors.white,
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
              //el color está en otro documento para facilitar el uso de dicho color
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      //envía a la página para registrarse
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
