import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesday1/states/login_page.dart';


void main(){

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: LoginPage(),);
  }
}