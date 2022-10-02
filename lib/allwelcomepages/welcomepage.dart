import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../helper_classes/text.dart';
import 'introducing.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

class welcomepage extends StatefulWidget {
  const welcomepage({Key? key}) : super(key: key);

  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  PageController pageController = PageController();
  int currentIndex = 0;
  var pages = [page1(), page2(), page3()];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
        pageController.animateToPage(currentIndex,
            duration: Duration(microseconds: 600),
            curve: Curves.fastLinearToSlowEaseIn);
      } else if (currentIndex == 2) {
        currentIndex = 0;
        pageController.animateToPage(currentIndex,
            duration: Duration(microseconds: 600),
            curve: Curves.fastLinearToSlowEaseIn);
      }
    });
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(191, 157, 157, 1.0),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(191, 157, 157, 1.0),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.1,
                  margin: EdgeInsets.fromLTRB(10, 35, 10, 0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.08,
                          child: Lottie.asset(
                              "lottie/119484-emoticon-smile-face.json"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: size.width * 0.3,
                          height: size.height * 0.045,
                          child: text("Snoopy", Colors.black54, 25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                  width: size.width * 0.9,
                  height: size.height * 0.6,
                  color: Colors.white,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: pages,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Container(
                width: size.width * 0.7,
                height: size.height * 0.06,
                margin: EdgeInsets.fromLTRB(25, 20, 25, 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(163, 204, 190, 1.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          child: introduce(),
                          type: PageTransitionType.size,
                          alignment: Alignment.bottomCenter,
                          duration: Duration(seconds: 1),
                          reverseDuration: Duration(seconds: 1),
                        ));
                  },
                  child: text("Get Started", Colors.black54, 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
