import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class show {
  static showdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator(),),
        barrierDismissible: false
    );
  }
}