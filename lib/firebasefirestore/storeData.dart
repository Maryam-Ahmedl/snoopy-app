import 'dart:core';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences{

  static SharedPreferences? _preferences;

  static const _keyData = '';
  static const _keyUserName = '';

  static Future init() async =>
   _preferences =  await SharedPreferences.getInstance();

  static Future setData(String data) async =>
      await _preferences!.setString(_keyData, data);

  static String? getData() => _preferences!.getString(_keyData);


  static Future setUserName(String data) async =>
      await _preferences!.setString(_keyUserName, data);

  static String? getUserName() => _preferences!.getString(_keyUserName);

}