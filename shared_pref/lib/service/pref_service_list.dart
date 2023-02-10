
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class PrefsList{
//for list String
  static writeListString(List<String> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('listString', list);
  }

  static Future readListString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("listString");
  }

  static Future<bool> removeListString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("listString");
  }

}