import 'package:flutter/material.dart';
import 'package:snooopy_app/helper_classes/text.dart';



Container button(
    BuildContext context,
    String name,
    Color color,
    double fontsize,
    Color backgroundcolor,
    Function function){
  return Container(
    child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundcolor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              )
          ),
        ),
        child:text(name, color, fontsize),
        onPressed:() {
          function();
        }
    ),
  );
}
