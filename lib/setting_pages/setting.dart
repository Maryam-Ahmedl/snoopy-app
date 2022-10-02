import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:snooopy_app/helper_classes/button.dart';
import '../firebasefirestore/storeData.dart';


import '../helper_classes/text.dart';
import '../mainPage/curvied_navigation_bar.dart';
import '../notification/control_notifiaction.dart';
import '../registerationpages/buildloginscreen.dart';

class setting extends StatefulWidget {
  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  String username = '';

  @override
  void initState() {
    super.initState();
    username = UserSimplePreferences.getUserName() ?? '';
  }

  final thecontroller = Get.put(control_notification());

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    email.text = user!.email!;
    userName.text = username;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown.shade400,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/3.jpg'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black38, BlendMode.darken)),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                border: Border.all(color: Colors.black)),
          ),
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 20,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 230,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 20,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: page(),
                                  type: PageTransitionType.scale,
                                  alignment: Alignment.topRight,
                                  duration: Duration(seconds: 1),
                                  reverseDuration: Duration(seconds: 1),
                                ));
                          },
                          icon: Icon(
                            Icons.home,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(100, 100, 20, 10),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText("Snoopy...",textStyle: TextStyle(
                     fontFamily: 'IBMPlexMono' ,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white
                    ),
                    speed: Duration(seconds: 1),
                    ),
                  ],
                  totalRepeatCount: 5,
                  pause: Duration(seconds: 1),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 40, 20, 5),
                width: size.width*0.75,
                child: text("User-Name", Colors.blueAccent, 15),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                width: size.width*0.75,
                child: TextField(
                  controller: userName,
                  decoration: InputDecoration(
                    hintText: "Nick Name",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 0, 20, 5),
                width: size.width*0.75,
                child: text("Email", Colors.blueAccent, 15),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                width: size.width*0.75,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Container(
                width: size.width*0.7,
                height: 50,
                margin: EdgeInsets.all(20),
                child: button(context, "Send Notification", Colors.white, 20, Colors.lightGreen, (){
                  thecontroller.send_notification();
                }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(80, 0, 80, 30),
                width: 50,
                height: 50,
                child: MaterialButton(
                  onPressed: () async{
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: Login(),
                          type: PageTransitionType.size,
                          alignment: Alignment.bottomCenter,
                          duration: Duration(milliseconds: 600),
                          reverseDuration: Duration(milliseconds: 600),
                        ));
                  },
                  child: text("sign out", Colors.white, 20),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blueAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
