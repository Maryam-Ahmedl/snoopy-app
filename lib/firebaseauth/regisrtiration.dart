import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snooopy_app/firebaseauth/showmessage.dart';
import 'package:snooopy_app/helper_classes/show_dialog.dart';



Future sign_up_with_email_and_password (String mail , String pass,BuildContext context) async{
  show.showdialog(context);
  try{
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: mail,
        password: pass
    );
  }on FirebaseAuthException catch(e){
      print(e);
      Utils.showSnackBar(e.message);
  }
}

Future<User?> sign_in(String email , String pass , BuildContext context) async{
  show.showdialog(context);

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try{
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
    user = userCredential.user;
  }on FirebaseAuthException catch(e){
    Navigator.pop(context);
    print(e);
    Utils.showSnackBar(e.message);
  }
  return user;
}




