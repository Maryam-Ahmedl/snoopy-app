import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../mainPage/curvied_navigation_bar.dart';
import '../helper_classes/button.dart';
import '../helper_classes/text.dart';
import '../firebasefirestore/storeData.dart';
import 'check_mode.dart';

class add_status extends StatefulWidget {
  @override
  State<add_status> createState() => _add_statusState();
}

class _add_statusState extends State<add_status> {
  void selected_date(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
  }

  double width = 100;
  dynamic result = "COMPLETELY OKAY";
  dynamic image = Image.asset('logo/happy.png');
  String username='';

  @override
  void initState(){
    super.initState();
    username = UserSimplePreferences.getUserName() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(230, 223, 175, 1.0),
              Color.fromRGBO(191, 157, 157, 1.0),
              Color.fromRGBO(163, 204, 190, 1.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40.0,
                          bottom: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                selected_date(context);
                              },
                              icon: Icon(
                                Icons.calendar_month,
                                size: 30,
                              ),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              child: Lottie.asset("lottie/119484-emoticon-smile-face.json"),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => page()));
                              },
                              icon: Icon(
                                Icons.close,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      text("\t Alright, "+username+"\nhow are felling today?",
                          Colors.white, 20),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: ClipOval(
                          child: image,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '${result}',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 20,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Slider(
                    max: 200,
                    min: 10,
                    value: width,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        width = value;
                        if (width < 40) {
                          result = 'REALLY TERRIBLE';
                          image = Image.asset('logo/neutral.png');
                        } else if (width > 40 && width < 80) {
                          result = "SOMEWHAT BAD";
                          image = Image.asset('logo/sad.png');
                        } else if (width > 80 && width < 120) {
                          result = "COMPLETELY OKAY";
                          image = Image.asset('logo/happy.png');
                        } else if (width > 120 && width < 160) {
                          result = "PRETTY GOOD";
                          image = Image.asset('logo/okay.png');
                        } else if (width > 160 && width < 200) {
                          result = "SUPER AWESOME";
                          image = Image.asset('logo/laugh.png');
                        }
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 70,
                    horizontal: 100,
                  ),
                  height: 50,
                  width: 200,
                  child: button(context, "Continue", Colors.black38, 22,
                      Colors.yellow.shade300, () async{
                    await UserSimplePreferences.setData(result);
                    Navigator.push(
                        context,
                        PageTransition(
                            child: checkmode(
                              mode: image,
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(seconds: 1),
                            reverseDuration: Duration(seconds: 1)));
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
