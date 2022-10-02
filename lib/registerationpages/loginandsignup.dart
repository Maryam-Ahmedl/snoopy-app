import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../helper_classes/text.dart';
import 'buildloginscreen.dart';
import 'buildsignupscreen.dart';
class loginScreen extends StatefulWidget{
  const loginScreen({Key? key}) : super(key: key);
  
  @override
  State<loginScreen> createState() => _loginScreenState();
}
class _loginScreenState extends State<loginScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(163, 204, 190, 1.0),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/6.jpg"),
                    fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20,50,20,0),
                  width: 150,
                  height: 150,
                  child: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_65DYreJ7ru.json"),
                ),
                Container(
                  width: size.width*0.75,
                  height: 80,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(10,120,10,25),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(191, 157, 157,1.0)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        )
                      )
                    ),
                    child: text("login", Colors.white, 25),
                    onPressed: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              child: Login(),
                              type: PageTransitionType.scale,
                              alignment: Alignment.center,
                              duration: Duration(seconds: 1),
                              reverseDuration: Duration(seconds: 1)
                          )
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width:size.width*0.14,
                    height: size.height*0.1,
                    child: text("OR", Colors.white, 30),
                  ),
                ),
                Container(
                  width: size.width*0.75,
                  height: 80,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(10,0,10,25),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(191, 157, 157,1.0)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        )
                      )
                    ),
                    child: text("sign up", Colors.white, 25),
                    onPressed: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              child: signupScreen(),
                              type: PageTransitionType.scale,
                              alignment: Alignment.center,
                              duration: Duration(seconds: 1),
                              reverseDuration: Duration(seconds: 1)
                          )
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
