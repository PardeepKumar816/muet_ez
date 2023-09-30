import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Size getDeviceSize(context) {
  return MediaQuery.of(context).size;
}


 final navigatorKey = GlobalKey<NavigatorState>();

Future<SharedPreferences> getSharedPreferencesInstance() async{
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  return localStorage;
}
