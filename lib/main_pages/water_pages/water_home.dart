import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../helper_classes/button.dart';
import '../../helper_classes/text.dart';
import '../../notification/control_notifiaction.dart';


class waterHome extends StatefulWidget {
  @override
  State<waterHome> createState() => _waterHomeState();
}

class _waterHomeState extends State<waterHome> {
  DateTime dateTime = DateTime.now();
  int value = 200;
  String? radioValue;
  bool _sportMode = false;
  final weightController = TextEditingController();
  final ageController = TextEditingController();
  int intakeWater = 0;
  int waterValue = 0 ;
  final thecontroller = Get.put(control_notification());



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(232, 204, 183, 1.0),
          title: text('Water Reminder', Colors.white, 25),
          centerTitle: true,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white60,
            indicatorWeight: 8,
            tabs: [
              Tab(
                text: 'Data',
              ),
              Tab(
                text: 'Home',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            setting(),
            water(),
          ],
        ),
      ),
    );
  }

  Widget water() {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              text('We help you drink enough water', Colors.black, 20),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 80,
                  width: 80,
                  child: Lottie.asset("lottie/96633-water-meter-fill.json",
                      repeat: true),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white60,
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 20),
                          height: 400,
                          width: 400,
                          child: circleSlider(),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        left: 0,
                        top: 220,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.lightBlueAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.water_drop_outlined,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (value<intakeWater)
                                      value=value+200;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: -250,
                        right: 0,
                        top: 300,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color.fromRGBO(232, 204, 183, 1.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.access_time,
                              size: 30,
                            ),
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: dateTime,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100));
                              if (newDate == null) return;
                              TimeOfDay? newTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(
                                  hour: dateTime.hour,
                                  minute: dateTime.minute,
                                ),
                              );
                              if (newTime == null) return;
                              final newDateTime = DateTime(
                                newDate.year,
                                newDate.month,
                                newDate.day,
                                newTime.hour,
                                newTime.minute,
                              );
                              setState(() {
                                dateTime = newDateTime;
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        left: 250,
                        right: 0,
                        top: 300,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color.fromRGBO(232, 204, 183, 1.0),
                          child: Icon(
                            Icons.water_drop_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width*0.7,
                height: 50,
                margin: EdgeInsets.all(20),
                child: button(context, "Send Notification", Colors.white, 20, Colors.cyan, (){
                  thecontroller.send_notification();
                }),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(232, 204, 183, 1.0),
    );
  }

  Widget setting () {
    return Scaffold(
        backgroundColor: Color.fromRGBO(232, 204, 183, 1.0),
        body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.only( left: 20,right: 20,top: 20),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    text(
                      ' Sport mode',
                      Colors.black,
                      20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 150),
                      child: Switch(
                        value: _sportMode,
                        onChanged: (value) {
                          setState(() {
                            _sportMode = value;
                          }
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width - 40,
                      margin: EdgeInsets.symmetric( vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    child: text('Gender', Colors.black54, 25)),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: "Male",
                                        groupValue: radioValue,
                                        onChanged: (value) {
                                          setState(() {
                                            radioValue = value.toString();
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      text("Male", Colors.lightBlueAccent, 20),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: "Female",
                                        groupValue: radioValue,
                                        onChanged: (value) {
                                          setState(() {
                                            radioValue = value.toString();
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      text("Female", Colors.lightBlueAccent, 20),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            width: 335,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: weightController,
                              decoration: InputDecoration(
                                border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                                labelText: "Weight",
                                suffix: text("KG", Colors.black, 20),
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            width: 335,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: ageController,
                              decoration: InputDecoration(
                                border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                                labelText: "Age",
                                suffix: text("Years", Colors.black, 20),
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black54,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 40,
                              horizontal: 100,
                            ),
                            height: 40,
                            width: 150,
                            child: button(context, "Save", Colors.white, 20,
                              Colors.lightBlue, () {
                                  if (ageController.text != null &&
                                      weightController.text != null &&
                                      radioValue != null) {
                                    String weight = weightController.text;
                                    String age = ageController.text;
                                    int w = int.parse(weight);
                                    int a = int.parse(age);
                                    if (_sportMode == false) {
                                      if (a <= 30) {
                                        intakeWater =
                                            (((w / 2.2) + (a * 40)) / 30)
                                                .round();
                                        intakeWater =
                                            ((intakeWater / 33.8) * 1000)
                                                .round();
                                        intakeWater =
                                        (((intakeWater ~/ 100) * 100) + 100);
                                      }
                                      else if (a > 30 && a < 55) {
                                        intakeWater =
                                            (((w / 2.2) + (a * 35)) / 30)
                                                .round();
                                        intakeWater =
                                            ((intakeWater / 33.8) * 1000)
                                                .round();
                                        intakeWater =
                                        (((intakeWater ~/ 100) * 100) + 100);
                                      }
                                      else {
                                        intakeWater =
                                            (((w / 2.2) + (a * 30)) / 30)
                                                .round();
                                        intakeWater =
                                            ((intakeWater / 33.8) * 1000)
                                                .round();
                                        intakeWater =
                                        (((intakeWater ~/ 100) * 100) + 100);
                                      }
                                    }
                                    else {
                                      if (radioValue == 'Male')
                                        intakeWater = 3700;
                                      else
                                        intakeWater = 2700;
                                    }
                                    setState(() {
                                      waterValue = intakeWater;
                                    }
                                    );
                                    Fluttertoast.showToast(
                                        msg: "click home on the top",
                                        backgroundColor: Colors.white,
                                        toastLength: Toast.LENGTH_LONG,
                                        textColor: Colors.red
                                    );
                                  }
                                  else {
                                    Fluttertoast.showToast(
                                        msg: "fields are required",
                                      backgroundColor: Colors.white,
                                      toastLength: Toast.LENGTH_LONG,
                                      textColor: Colors.red
                                    );
                                  }
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ]
        )
    );
  }

  Widget circleSlider() {
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 204, 183, 1.0),
      body: SingleChildScrollView(
        child: Center(
          child: CircularPercentIndicator(
            radius: 250,
            lineWidth: 20,
            percent:((value/waterValue))%10,
            progressColor: Colors.lightBlueAccent,
            backgroundColor: Colors.black12,
            circularStrokeCap: CircularStrokeCap.round,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text('Drunk', Colors.black, 20),
                SizedBox(
                  height: 5,
                ),
                text('${value}', Colors.black, 20),
                SizedBox(
                  height: 5,
                ),
                text('out of '+ '${waterValue}' + ' ML', Colors.black, 20),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}