import 'package:flutter/material.dart';
import 'package:organics/pages/LoginPage.dart';
import 'package:organics/pages/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowMaterialGrid: false,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Nunito',
    ),
    initialRoute: 'SplashScreen',
    routes: {
      'SplashScreen': (context) =>  const SplashScreen(),
    },
  ));
}
