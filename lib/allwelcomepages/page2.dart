import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper_classes/text.dart';



class page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(191, 157, 157,1.0),
      ),
      child:  ListView(
        scrollDirection: Axis.vertical,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: size.width,
              height: 250,
              child: Image.asset("assets/page2.jpeg"),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                width: size.width,
                child:text("-track habits , be Happy", Colors.black54, 15)
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 20, 30),
                width: size.width,
                child: text("Bad habits are like a comfortable bed, easy to get into, but hard to get out of. \n ~ Traditional Proverb ~", Colors.white, 18)
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
              width: size.width*0.2,
              child: Icon(Icons.navigate_next),
            ),
          ),

        ],
      ),
    );
  }
}