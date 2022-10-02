import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl/intl.dart';
import 'package:snooopy_app/add_mode/write_text.dart';
import '../helper_classes/button.dart';
import '../mainPage/curvied_navigation_bar.dart';
import '../helper_classes/text.dart';

class checkmode extends StatefulWidget {
  const checkmode({Key? key, required this.mode}) : super(key: key);
  final dynamic mode;
  @override
  State<checkmode> createState() => _checkmodeState();
}

class _checkmodeState extends State<checkmode> {
  List<String> item = [];
  bool workselected = false;
  String work = 'work';
  bool familyselected = false;
  String family = 'family';
  bool friendsselected = false;
  String friends = 'friends';
  bool foodselected = false;
  String food = 'food';
  bool travilingselected = false;
  String traviling = 'traviling';
  bool exerciseselected = false;
  String exercise = 'exercise';
  bool gamingselected = false;
  String gaming = 'gaming';
  bool sleepselected = false;
  String sleep = 'sleep';
  bool musicselected = false;
  String music = 'music';
  bool Shoppingselected = false;
  String Shopping = 'Shopping';

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
              //Color.fromRGBO(163, 204, 190,1.0),
              Color.fromRGBO(191, 157, 157, 1.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          width: size.width * 0.1,
                          height: size.height * 0.1,
                          child: IconButton(
                            icon: Icon(Icons.close_sharp),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    child: page(),
                                    type: PageTransitionType.fade,
                                    alignment: Alignment.center,
                                    duration: Duration(seconds: 1),
                                  ));
                            },
                          )),
                    ),
                    text("Date: ", Colors.black54, 20),
                    Text(
                      DateFormat('dd-MM-yyyy').format(DateTime.now()),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IBMPlexMono',
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 20, 10, 15),
                      child: button(context, "Next", Colors.black54, 20,
                          Color.fromRGBO(163, 204, 190, 1.0), () {
                        if (item.isEmpty ||
                            item.length > 4 ||
                            item.length < 4) {
                          Fluttertoast.showToast(
                              msg: "select 4 activities",
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              toastLength: Toast.LENGTH_LONG);
                        } else {
                          Navigator.push(
                              context,
                              PageTransition(
                                child: write_text(
                                  check_in: item,
                                ),
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(seconds: 1),
                                reverseDuration: Duration(seconds: 1),
                              ));
                        }
                      }),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 100,
                child: widget.mode,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: text(
                      "What Activities make this feeling?", Colors.black54, 15),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 25, 0, 10),
                  child: text("Activities", Colors.white, 14),
                ),
              ),
              Container(
                width: size.width * 0.85,
                height: size.height * 0.52,
                color: Color.fromRGBO(163, 204, 190, 0.5),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                              //margin: EdgeInsets.all(15),
                              width: size.width * 0.9,
                              height: size.height * 0.15,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        travilingselected = !travilingselected;
                                      });
                                      if (travilingselected) {
                                        item.add(traviling);
                                      } else if (!travilingselected) {
                                        item.remove(traviling);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: travilingselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons.wallet_travel_sharp,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Travel", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        familyselected = !familyselected;
                                      });
                                      if (familyselected) {
                                        item.add(family);
                                      } else if (!familyselected) {
                                        item.remove(family);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: familyselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons.family_restroom,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Family", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        friendsselected = !friendsselected;
                                      });
                                      if (friendsselected) {
                                        item.add(friends);
                                      } else if (!friendsselected) {
                                        item.remove(friends);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: friendsselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons.person,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Friend", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        foodselected = !foodselected;
                                      });
                                      if (foodselected) {
                                        item.add(food);
                                      } else if (!foodselected) {
                                        item.remove(food);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: foodselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons.food_bank,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Food", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              //margin: EdgeInsets.all(25),
                              width: size.width * 0.9,
                              height: size.height * 0.15,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        workselected = !workselected;
                                      });
                                      if (workselected) {
                                        item.add(work);
                                      } else if (!workselected) {
                                        item.remove(work);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: workselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons.work,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Work", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        exerciseselected = !exerciseselected;
                                      });
                                      if (exerciseselected) {
                                        item.add(exercise);
                                      } else if (!exerciseselected) {
                                        item.remove(exercise);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: exerciseselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons
                                                  .sports_martial_arts_outlined,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Exercise", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        sleepselected = !sleepselected;
                                      });
                                      if (sleepselected) {
                                        item.add(sleep);
                                      } else if (!sleepselected) {
                                        item.remove(sleep);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: sleepselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons.bed,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Sleep", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        musicselected = !musicselected;
                                      });
                                      if (musicselected) {
                                        item.add(music);
                                      } else if (!musicselected) {
                                        item.remove(music);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: musicselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons.music_note,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Music", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              //margin: EdgeInsets.all(25),
                              width: size.width * 0.9,
                              height: size.height * 0.15,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        gamingselected = !gamingselected;
                                      });
                                      if (gamingselected) {
                                        item.add(gaming);
                                      } else if (!gamingselected) {
                                        item.remove(gaming);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: gamingselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons.sports_esports,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Gaming", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Shoppingselected = !Shoppingselected;
                                      });
                                      if (Shoppingselected) {
                                        item.add(Shopping);
                                      } else if (!Shoppingselected) {
                                        item.remove(Shopping);
                                      }
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(microseconds: 500),
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                color: Shoppingselected
                                                    ? Colors.blue
                                                    : Colors.grey,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromRGBO(
                                                      191, 157, 157, 1.0),
                                                  width: 2.5,
                                                )),
                                            child: Icon(
                                              Icons.shopping_cart,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: text(
                                                "Shopping", Colors.black38, 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
