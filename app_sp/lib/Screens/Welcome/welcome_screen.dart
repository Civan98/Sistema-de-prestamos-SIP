import 'package:flutter/material.dart';
import 'components/body_welcome.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //llama al body del welcome que está en los componentes de la página welcome
      body: BodyWelcome(),
    );
  }
}
