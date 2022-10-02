import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snooopy_app/firebaseauth/showmessage.dart';
import '../helper_classes/text.dart';
import '../registerationpages/validation.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  
  TextEditingController _email = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void dispose(){
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
     backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: text("Reset Password", Colors.white, 20),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
              child: Container(
                alignment: Alignment.center,
                height: size.height*0.5,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                        alignment: Alignment.center,
                        width: size.width*0.6,
                        height: size.height*0.1,
                        child: text("\tReceive an email \n  to reset password ", Colors.white, 22),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: _email,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            else if (!validateEmail(value)) {
                              return 'Enter Valid Email';
                            }
                            else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              labelText: "email address",
                              labelStyle: TextStyle(
                                color: Colors.white
                              ),
                              prefixIcon: Icon(Icons.email_outlined),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(35)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(35)),
                              )),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(163, 204, 190, 1.0)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                            ),
                          ),
                          icon: Icon(Icons.email_outlined),
                          label: text("Reset password", Colors.black54, 20),
                          onPressed: () async{
                            if (_formKey.currentState!.validate()) {
                               _resetpassword();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ),
        ),
    );
  }
  Future _resetpassword () async {
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator(),),
        barrierDismissible: false
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _email.text.trim());
      Utils.showSnackBar("Password Reset Email was sent.");
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch(e){
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}

