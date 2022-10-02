import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../helper_classes/button.dart';
import 'game.dart';



class game_ui extends StatelessWidget {
  const game_ui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.black87,
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container(
                height: 100,
                child: DefaultTextStyle(
                  style: TextStyle(
                      fontFamily: 'IBMPlexMono',
                      fontSize: 30,
                      color: Colors.white
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText("Tic Tak Teo..."),
                      //TyperAnimatedText("play with your friend..")
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
              ),
              Container(
                width: 290,
                height: 290,
                child: Lottie.asset("lottie/119665-tic-tac-toe-1.json"),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 120, 10, 10),
                width: 350,
                height: 50,
                child: button(context,"Get Started with your friend", Colors.white, 17, Colors.purple.shade300, () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: game(),
                      type: PageTransitionType.scale,
                      alignment: Alignment.bottomCenter,
                      duration: Duration(seconds: 2),
                      reverseDuration: Duration(seconds: 1),
                    ),
                  );
                }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
