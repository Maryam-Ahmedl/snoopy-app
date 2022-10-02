import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../firebaseauth/regisrtiration.dart';
import '../firebaseauth/resetpassword.dart';
import '../helper_classes/button.dart';
import '../helper_classes/text.dart';
import '../mainPage/curvied_navigation_bar.dart';
import 'buildsignupscreen.dart';
import 'validation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool close = true;

  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              width: size.width * 0.8,
              height: size.height * 0.5,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(163, 204, 190, 1.0),
                    Color.fromRGBO(230, 223, 175, 1.0),
                    Color.fromRGBO(191, 157, 157, 1.0),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Form(
                key: _formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: _email,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
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
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            labelText: "email address",
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
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: TextFormField(
                        controller: _password,
                        obscureText: close,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    close = !close;
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
                      margin: EdgeInsets.fromLTRB(0, 0, 100, 0),
                      child: TextButton(
                        child: text("Reset Password?", Colors.blue, 15),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                child: resetpassword(),
                                type: PageTransitionType.size,
                                alignment: Alignment.bottomCenter,
                                duration: Duration(seconds: 1),
                                reverseDuration: Duration(seconds: 1),
                              ));
                        },
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(60, 40, 60, 0),
                      child: button(context, "login", Colors.black54, 25,
                          Color.fromRGBO(163, 204, 190, 1.0), () async {
                        if (_formKey.currentState!.validate()) {
                          User? user = await sign_in(
                              _email.text, _password.text, context);
                          print(user);
                          if (user != null) {
                            Navigator.push(
                                context,
                                PageTransition(
                                  child: page(),
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(seconds: 1),
                                  reverseDuration: Duration(seconds: 1),
                                ));
                          }
                        }
                      }),
                    ),
                    Container(
                      child: TextButton(
                        child: text("sign up?", Colors.blueAccent, 15),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                child: signupScreen(),
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
