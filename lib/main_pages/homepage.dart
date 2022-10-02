import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:snooopy_app/main_pages/pageView/proverbs_page.dart';
import '../add_mode/add_status.dart';
import '../firebasefirestore/storeData.dart';
import '../helper_classes/text.dart';
import '../setting_pages/setting.dart';
import '../tac_tic_toe/game_ui.dart';
import 'package:page_transition/page_transition.dart';



class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  String username = '';

  @override
  void initState(){
    super.initState();
    username = UserSimplePreferences.getUserName() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(131, 153, 168,1.0),
      // Color.fromRGBO(191, 157, 157,1.0),
      body: Stack(
        children: [
          Container(
            height: size.height*0.54,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Color.fromRGBO(163, 204, 190, 1.0),
                    Color.fromRGBO(219, 192, 158,1.0),
                    Color.fromRGBO(191, 157, 157,1.0),
                   // Color.fromRGBO(163, 204, 190, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(55),
                  bottomRight: Radius.circular(55),
                ),
                border: Border.all(color: Colors.black26)
            ),
          ),
          ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                alignment: Alignment.centerRight,
                width: size.width*0.05,
                child:CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child :IconButton(
                    onPressed:(){
                      Navigator.push(
                        context,
                        PageTransition(
                          child: setting(),
                          type: PageTransitionType.scale,
                          alignment: Alignment.topRight,
                          duration: Duration(seconds: 1),
                          reverseDuration: Duration(seconds: 1),
                        ),
                      );
                    },
                    icon: Icon(Icons.person_sharp,color: Colors.white,size: 25,),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  width: 100,
                  height: 100,
                  child: Lottie.asset("lottie/119484-emoticon-smile-face.json"),
                  // child: Image.asset("logo/mainIcon.png"),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width*0.5,
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: text("Welcome, " + username, Colors.black54, 20),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: size.width*0.5,
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                height: size.height*0.09,
                child: Column(
                  children: [
                    text("Today,", Colors.white, 20),
                    Text(DateFormat('dd-MM-yyyy').format(DateTime.now()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IBMPlexMono',
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    PageTransition(
                      child: proverbs_page(),
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                      duration: Duration(seconds: 1),
                      reverseDuration:  Duration(seconds: 1),
                    ),
                  );
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          alignment: Alignment.bottomCenter,
                          content: text("Swipe up ", Colors.white, 20),
                          backgroundColor: Colors.transparent,
                          actions: [
                            ElevatedButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: text("understood", Colors.white, 15))
                          ],

                        );
                      }
                  );
                },
                child: Container(
                  height: size.height*0.26,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/2.jpg'),
                        fit: BoxFit.cover,
                        colorFilter:
                        ColorFilter.mode(Colors.black38, BlendMode.darken)
                    ),
                    //color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 28,),
                      Center(
                          child: text("  Every great dream begins with a \n  "
                              "dreamer. Always remember, you \n  "
                              "have within you the strength, \n  "
                              "the patience, and the passion \n  "
                              "to reach for the stars to \n  "
                              "change the world.", Colors.white, 15,)
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: size.width*0.7,
                        alignment: Alignment.centerRight,
                        child:Icon(
                          Icons.smart_display_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    PageTransition(
                      child: add_status(),
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                      duration: Duration(seconds: 1),
                      reverseDuration:  Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  margin: EdgeInsets.fromLTRB(30, 30, 30, 40),
                  height: size.height*0.18,
                  //margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(230, 223, 175,1.0),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: CircleAvatar(
                                radius: 25,
                                child: Image.asset("logo/mainIcon.png"),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: text("mode check-in", Colors.black54, 18),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: text("How are you feeling Today? ", Colors.blueAccent, 15),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                  margin: EdgeInsets.fromLTRB(60, 10, 20, 0),
                  child: text("do you want to play a game?", Colors.black54, 17)
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    PageTransition(
                      child: game_ui(),
                      type: PageTransitionType.scale,
                      alignment: Alignment.center,
                      duration: Duration(seconds: 1),
                      reverseDuration:  Duration(seconds: 1),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  margin: EdgeInsets.fromLTRB(80, 10, 80, 40),
                  height: size.height*0.18,
                  //margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Lottie.asset("lottie/119665-tic-tac-toe-1.json"),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
