import 'package:flutter/material.dart';

class AppConstant {
  static String appName = 'Nes Coffee';
  static TextStyle h1Style() {
    return TextStyle(fontSize: 48, fontWeight: FontWeight.bold);
  }
  static TextStyle h2Style() {
    return TextStyle(fontSize: 36, fontWeight: FontWeight.w700);
  }
  static TextStyle h3Style({ FontWeight? fontWeight}) {
    return TextStyle(fontSize: 16, fontWeight: fontWeight ?? FontWeight.normal);
  }
}
