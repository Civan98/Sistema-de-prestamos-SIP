import 'package:app_sp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_sp/Screens/Welcome/welcome_screen.dart';
import 'package:app_sp/constants.dart';
import 'package:provider/provider.dart';

import 'Screens/Login/login_screen.dart';

//Permite unir o pegar un estado o valor en todos los hijos
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App sp',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AutenticationWrapper(),//WelcomeScreen(),
    ),
      );
  }
}

class AutenticationWrapper extends StatelessWidget {
  const AutenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
  final firebaseUser = context.watch<User>();
  if (firebaseUser != null) {
      return WelcomeScreen();
    }
    return LoginScreen();
    }
}