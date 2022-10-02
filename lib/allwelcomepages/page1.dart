import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper_classes/text.dart';


class page1 extends StatelessWidget{
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
               height: size.height*0.3,
               child: Image.asset("assets/page1.jpg"),
             ),
           ),
           Align(
             alignment: Alignment.topCenter,
             child: Container(
               margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
               width: size.width,
               child:text("-track your mode and activities", Colors.black54, 15)
             ),
           ),
           Align(
             alignment: Alignment.center,
             child: Container(
               width: size.width,
               child: text("\t If you want something done \n  right, you have to do it \n  yourself. ", Colors.white, 18)
             ),
           ),
           Align(
             alignment: Alignment.center,
             child: Container(
               margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
               width: size.width,
               child: text("\t Write a mood diary to find\n  yourself ", Colors.black54, 18)
             ),
           ),
           Align(
             alignment: Alignment.centerRight,
             child: Container(
               margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
               width: size.width*0.2,
               child: Icon(Icons.navigate_next),
             ),
           ),

         ],
      ),
    );
  }
}