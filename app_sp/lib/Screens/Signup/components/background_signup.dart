import 'package:flutter/material.dart';

class BackgroundSignUp extends StatelessWidget {
  //los widgets de la entrada de datos para el registro, anteriormente esta propiedad estaba como child
  final Widget inputs;
  //el constructor recibe los widgets para el registro
  const BackgroundSignUp({
    Key key,
    @required this.inputs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //imagen de esquina superior izquierda
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/signup_top.png",
              width: size.width * 0.35,
            ),
          ),
          //imagen esquina inferior izquierda
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.25,
            ),
          ),
          inputs,
        ],
      ),
    );
  }
}
