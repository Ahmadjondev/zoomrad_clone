import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoomrad/constant.dart';
import 'package:zoomrad/screens/home.dart';
import 'package:zoomrad/screens/lock.dart';

var shared;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Run().con;
  final prefs = await SharedPreferences.getInstance();
  shared = prefs;
  runApp(MaterialApp(
    home: Lock(),
    theme: ThemeData(
      fontFamily: 'mont_medium',
    ),
    debugShowCheckedModeBanner: false,
  ));
}


