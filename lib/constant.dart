import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoomrad/main.dart';

Color grey = const Color(0xFFB4B4B4);
Color toq_kok = const Color(0xFF1A2939);
Color back = const Color(0xFFF8F8F8);
Color active_color = const Color(0xFF22AF7B);
class Run{
   get con => FirebaseDatabase.instance
      .reference()
      .child("balance")
      .get().asStream();

}
class Tools {
  static String numberConvert(String amount) {
    return NumberFormat.currency(
      locale: 'uz-uz',
      symbol: '',
      decimalDigits: 0,
    ).format(int.parse(amount));
  }
}

void setCardName(String name) async {
  SharedPreferences pref = await shared;
  pref.setString('card_name', name);
}

 Future<String> getCardName() async {
  SharedPreferences pref = await shared;
  return pref.getString('card_name').toString();
}
