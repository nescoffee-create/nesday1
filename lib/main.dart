import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesday1/cores/app_http_override.dart';
import 'package:nesday1/states/login_page.dart';


Future<void> main() async {

  HttpOverrides.global = AppHttpOverride();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: LoginPage(),);
  }
}