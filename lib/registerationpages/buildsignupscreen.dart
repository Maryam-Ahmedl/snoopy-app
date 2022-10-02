import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../firebaseauth/regisrtiration.dart';
import '../firebasefirestore/storeData.dart';
import '../helper_classes/button.dart';
import '../helper_classes/text.dart';
import 'buildloginscreen.dart';
import 'validation.dart';


class signupScreen extends StatefulWidget {
  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  TextEditingController _email = TextEditingController();

  TextEditingController _pass = TextEditingController();

  TextEditingController _confirmpass = TextEditingController();

  TextEditingController _username = TextEditingController();

  bool close_pass = true;
  bool close_con_pass = true;
  final _formkey = GlobalKey<FormState>();

  String username = '';

  @override
  void initState() {
    super.initState();
    username =  UserSimplePreferences.getUserName() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    _username.text = username;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/6.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: size.width * 0.85,
              height: size.height * 0.7,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(163, 204, 190, 1.0),
                    Color.fromRGBO(230, 223, 175, 1.0),
                    Color.fromRGBO(191, 157, 157, 1.0),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Form(
                key: _formkey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _username,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) => username = value!,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              labelText: "Usre Name",
                              prefixIcon: Icon(Icons.person),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                              )),
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            } else if (!validateEmail(value)) {
                              return 'Enter Valid Email';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              labelText: "Email Address",
                              prefixIcon: Icon(Icons.email_outlined),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                              )),
                        )),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _pass,
                        obscureText: close_pass,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          } else if (value.length < 8) {
                            return 'password should be more than or equal to 8';
                          } else if (value.length > 14) {
                            return 'password should be less than or equal to 14';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    close_pass = !close_pass;
                                  });
                                },
                                child: const Icon(Icons.remove_red_eye)),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _confirmpass,
                        obscureText: close_con_pass,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          } else if (value != _pass.text) {
                            return 'passwords did not match each other';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    close_con_pass = !close_con_pass;
                                  });
                                },
                                child: const Icon(Icons.remove_red_eye)),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            labelText: "Confirm-Password",
                            prefixIcon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                            )),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(30, 40, 30, 0),
                      child: button(
                          context,
                          "sign up with email",
                          Colors.black54,
                          20,
                          Color.fromRGBO(163, 204, 190, 1.0), () async {
                        if (_formkey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (context) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              barrierDismissible: false);
                          sign_up_with_email_and_password(
                              _email.text.trim(), _pass.text.trim(), context);
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Login(),
                                  type: PageTransitionType.size,
                                  alignment: Alignment.center,
                                  duration: Duration(seconds: 1),
                                  reverseDuration: Duration(seconds: 1)));
                        }
                      }),
                    ),
                    Container(
                      child: TextButton(
                        child: text("login?", Colors.blueAccent, 15),
                        onPressed: (){
                          Navigator.push(
                              context,
                              PageTransition(
                                child: Login(),
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(seconds: 1),
                                reverseDuration: Duration(seconds: 1),
                              ));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
