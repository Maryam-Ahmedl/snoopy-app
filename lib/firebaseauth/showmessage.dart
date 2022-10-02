import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontFamily: 'IBMPlexMono'),
      ),
      backgroundColor: Colors.white,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
