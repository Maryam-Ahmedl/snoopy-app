import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';



import '../firebasefirestore/add_data.dart';
import '../firebasefirestore/storeData.dart';
import '../helper_classes/button.dart';
import '../helper_classes/text.dart';
import '../mainPage/curvied_navigation_bar.dart';
import '../main_pages/mypage.dart';

class write_text extends StatefulWidget {
  const write_text({Key? key, required this.check_in}) : super(key: key);

  final List<String> check_in;

  @override
  State<write_text> createState() => _write_textState();
}

class _write_textState extends State<write_text> {
  TextEditingController header = TextEditingController();
  TextEditingController sub_header = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  String caseName = '';
  String id='';

  @override
  void initState() {
    super.initState();
    caseName = UserSimplePreferences.getData() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(163, 204, 190, 1.0),
                Color.fromRGBO(191, 157, 157, 1.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  height: 60,
                  margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 40, 0),
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
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
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            child: IconButton(
                              icon: Icon(Icons.close_sharp),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      child: page(),
                                      type: PageTransitionType.size,
                                      alignment: Alignment.topRight,
                                      duration: Duration(seconds: 1),
                                      reverseDuration: Duration(seconds: 1),
                                    ));
                              },
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Lottie.asset("lottie/119484-emoticon-smile-face.json"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 25),
                  padding: EdgeInsets.all(15),
                  height: size.height*0.18,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: text(
                              "Activities", Colors.blueAccent.shade700, 15),
                        ),
                      ),
                      Container(
                        height: 90,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin:EdgeInsets.all(5),
                              child: Chip(
                                label: text(widget.check_in[0], Colors.black54, 18),
                                padding: EdgeInsets.all(8),
                              ),
                            ),
                            Container(
                              margin:EdgeInsets.all(5),
                              child: Chip(
                                label: text(widget.check_in[1], Colors.black54, 18),
                                padding: EdgeInsets.all(8),
                              ),
                            ),
                            Container(
                              margin:EdgeInsets.all(5),
                              child: Chip(
                                label: text(widget.check_in[2], Colors.black54, 18),
                                padding: EdgeInsets.all(8),
                              ),
                            ),
                            Container(
                              margin:EdgeInsets.all(5),
                              child: Chip(
                                label: text(widget.check_in[3], Colors.black54, 18),
                                padding: EdgeInsets.all(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _keyForm,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 25, 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          width: size.width * 0.8,
                          height: size.height * 0.075,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            maxLines: 1,
                            controller: header,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Title...",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blue.shade700,
                                    fontFamily: 'IBMPlexMono')),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          width: size.width * 0.8,
                          height: size.height * 0.095,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            maxLines: 2,
                            controller: sub_header,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Say something...",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.blue.shade700,
                                    fontFamily: 'IBMPlexMono')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
                  width: size.width * 0.6,
                  height: size.height * 0.08,
                  child: button(context, "Complete-check", Colors.white, 20,
                      Color.fromRGBO(5, 83, 88, 1.0), () {
                    if (_keyForm.currentState!.validate()) {
                      addData(widget.check_in, header.text, sub_header.text,
                          caseName);
                      Navigator.push(
                          context,
                          PageTransition(
                            child: MyPage(),
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(seconds: 1),
                            reverseDuration: Duration(seconds: 1),
                          ));
                    }
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
