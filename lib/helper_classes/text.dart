import 'package:flutter/material.dart';

class text extends StatelessWidget{
  String textname = "";
  double fontsize = 5;
  Color textcolor = Colors.cyan;

  text(this.textname,this.textcolor,this.fontsize);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(textname,
        style: TextStyle(
          fontSize: fontsize,
          color: textcolor,
          fontFamily: 'IBMPlexMono',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}