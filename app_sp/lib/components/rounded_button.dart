import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  //propiedades de la clase
  final String text;
  //press es una función (la que se usa para dar funcionalidad al botón)
  final Function press;
  final Color color, textColor;
  // constructor, los parámetros requeridos son text y press
  const RoundedButton({
    Key key,
    @required this.text,
    @required this.press,
    @required this.color,
    @required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //margenes en la parte de arriba y abajo del contenedor (botón)
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      //clipRRect es para dar los bordes circulares al contenedor (botones)
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        //crear un botón simple, EL FLATBUTTON quedará obsoleto
        child: ElevatedButton(
            onPressed: press,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Text(
                text,
                style: TextStyle(color: textColor),
              ),
            )),
      ),
    );
  }
}
