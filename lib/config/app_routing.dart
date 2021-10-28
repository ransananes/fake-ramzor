import 'package:flutter/material.dart';
// import 'package:flutter_splash/screens/api_screen.dart';
// import 'package:flutter_splash/screens/main_screen.dart';
import '../screens/splashScreen.dart';
import '../screens/mainScreen.dart';

class MySplashApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Splash Sample',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'Poppins'
      ),
      home: SplashScreen(),
      routes: {
        '/splash': (context) => SplashScreen(),
        '/main': (context) => MainScreen(),
        // '/api': (context) => ApiScreen()
      },
    );
  }
}