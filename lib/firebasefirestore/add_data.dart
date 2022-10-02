import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


Future<void> addData(List<String> list , String title, String sub_title ,String _case) async {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  _fireStore.collection("Data").add(
    <String,dynamic>{
      'date' : DateFormat('dd-MM-yyyy').format(DateTime.now()),
      'item1':list[0],
      'item2':list[1],
      'item3':list[2],
      'item4':list[3],
      'title':title,
      'sub-title':sub_title,
      'case-name': _case,
    }
  );
  Fluttertoast.showToast(
      msg: "Saved",
      textColor: Colors.black54,
      backgroundColor: Colors.blue.shade300,
      toastLength: Toast.LENGTH_LONG,
  );
}

