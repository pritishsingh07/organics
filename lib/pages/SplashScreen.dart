import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organics/pages/LoadingPage.dart';

import 'LoginPage.dart';

class SplashScreen extends StatelessWidget  {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: const Color.fromARGB(255, 0, 122, 122),
        splashIconSize: 80,
        centered: true,
        splash:"lib/asset/splashlogo.png",
        nextScreen: const LoadingPage(),
        duration: 2000,
      );
  }
}



