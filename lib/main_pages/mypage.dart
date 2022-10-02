import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';


import '../helper_classes/text.dart';
import '../mainPage/curvied_navigation_bar.dart';
import '../setting_pages/setting.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int count = 0;
  deleteData(id) async {
    await FirebaseFirestore.instance.collection("Data").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(5, 83, 88, 1.0),
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Container(
              width: 40,
              height: 40,
              child: Lottie.asset("lottie/119484-emoticon-smile-face.json"),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              child: text("Personal-Page", Colors.grey, 15),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                child: page(),
                type: PageTransitionType.size,
                alignment: Alignment.topLeft,
                duration: Duration(seconds: 1),
                reverseDuration: Duration(seconds: 1),
              ),
            );
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.person_outline_sharp),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: setting(),
                    type: PageTransitionType.size,
                    alignment: Alignment.topRight,
                    duration: Duration(seconds: 1),
                    reverseDuration: Duration(seconds: 1),
                  ),
                );
              })
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(163, 204, 190, 1.0),
              Color.fromRGBO(230, 223, 175, 1.0),
              Color.fromRGBO(191, 157, 157, 1.0),
              Color.fromRGBO(163, 204, 190, 1.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Data").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: text("You have not any check", Colors.black, 25));
            }
            count = snapshot.data!.docs.length;
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Container(
                  width: size.width * 0.9,
                  height: size.height * 0.39,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 148, 113, 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: IconButton(
                            onPressed: () {
                              deleteData(document.id);
                              Fluttertoast.showToast(
                                msg: "deleted successfully.",
                                textColor: Colors.black54,
                                backgroundColor: Colors.green.shade300,
                                toastLength: Toast.LENGTH_LONG,
                              );
                            },
                            icon: Icon(
                              Icons.close_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: size.width * 0.8,
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(94, 118, 175, 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Align(
                          child: text(
                              "date: " + document["date"], Colors.white, 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(25, 15, 20, 0),
                          child: text("Case: " + document["case-name"],
                              Colors.black, 15),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(25, 5, 20, 0),
                          child: text("Title: " + document["title"],
                              Colors.blue.shade700, 15),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(25, 5, 25, 0),
                          child: text(
                              document["sub-title"], Colors.blue.shade700, 15),
                        ),
                      ),
                      Container(
                        height: size.height * 0.35 * 0.24,
                        margin: EdgeInsets.fromLTRB(15, 0, 10, 5),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 0, 10, 5),
                              child: Chip(
                                backgroundColor:
                                    Color.fromRGBO(236, 246, 250, 1.0),
                                label:
                                    text(document["item1"], Colors.black, 18),
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 5),
                              child: Chip(
                                backgroundColor:
                                    Color.fromRGBO(236, 246, 250, 1.0),
                                label:
                                    text(document["item2"], Colors.black, 18),
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 5),
                              child: Chip(
                                backgroundColor:
                                    Color.fromRGBO(236, 246, 250, 1.0),
                                label:
                                    text(document["item3"], Colors.black, 18),
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 5),
                              child: Chip(
                                backgroundColor:
                                    Color.fromRGBO(236, 246, 250, 1.0),
                                label:
                                    text(document["item4"], Colors.black, 18),
                                padding: EdgeInsets.all(5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
