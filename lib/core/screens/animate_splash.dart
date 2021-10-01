import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:network_operation/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class AnimateSplash extends StatelessWidget {
  const AnimateSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: 'assets/imgs/weblogo.png',
      nextScreen: Home(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      backgroundColor: Colors.blue,
    );
  }
}
