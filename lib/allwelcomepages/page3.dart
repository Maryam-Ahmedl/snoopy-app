import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper_classes/text.dart';


class page3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(191, 157, 157,1.0),
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: size.width,
              height: 250,
              child: Image.asset("assets/page3.jpg"),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                width: size.width,
                child:text("-get useful Insights", Colors.black54, 15)
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
                width: size.width,
                child: text("Know the Reason for bad modes \n "
                    " People who have never dealt with \n "
                    "depression think it's just being \n "
                    "sad or being in a bad mood. That's \n "
                    "not what depression is for me; \n "
                    "it's falling into a state of \n "
                    "grayness and numbness.\n "
             "       ~ Dan Reynolds ~", Colors.white, 15)
            ),
          ),
        ],
      ),
    );
  }
}