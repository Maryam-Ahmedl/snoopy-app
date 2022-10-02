import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../firebasefirestore/storeData.dart';
import '../helper_classes/text.dart';
import '../registerationpages/loginandsignup.dart';

class introduce extends StatefulWidget {
  const introduce({Key? key}) : super(key: key);

  @override
  State<introduce> createState() => _introduceState();
}

class _introduceState extends State<introduce> {
  TextEditingController hinttext = TextEditingController();

  // clean up the controller when the widget is disposed
  void dispose(){
    hinttext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(230, 223, 175,1.0),
                  Color.fromRGBO(191, 157, 157,1.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 90,
                height: 90,
                child: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_65DYreJ7ru.json"),
              ),
              Container(
                width: 600,
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                child: text("  Nice to meet you my friend! \n"
                    "    so what do your friends \n          call you ?", Colors.black54, 20),
              ),
              SizedBox(height: 100,),
              Container(
                color: Colors.grey.shade300,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller: hinttext,
                ),
              ),
              SizedBox(height: 240,),
              Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                width: 350,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(163, 204, 190,1.0)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                  ),
                  onPressed: () async{
                    if (hinttext.text == ""){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: text("Enter your Nick Name", Colors.black54, 20),
                          backgroundColor: Color.fromRGBO(163, 204, 190,1.0),
                        ),
                      );
                    }
                    else {
                      await UserSimplePreferences.setUserName(hinttext.text);
                      Navigator.push(context,
                          PageTransition(
                            child: loginScreen(),
                            type: PageTransitionType.size,
                            alignment: Alignment.bottomCenter,
                            duration: Duration(milliseconds: 600),
                            reverseDuration: Duration(milliseconds: 600),
                          )
                      );
                    }
                  },
                  child: text("Continue", Colors.black54, 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
