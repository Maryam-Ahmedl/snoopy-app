import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:snooopy_app/main_pages/water_pages/water_home.dart';

class water_ui extends StatefulWidget {
  const water_ui({Key? key}) : super(key: key);

  @override
  State<water_ui> createState() => _water_uiState();
}

class _water_uiState extends State<water_ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splash: Lottie.asset("lottie/96633-water-meter-fill.json",repeat: true),
        splashTransition: SplashTransition.scaleTransition,
        duration: 2500,
        splashIconSize: 150,
        nextScreen: waterHome(),
      ),
    );
  }
}
