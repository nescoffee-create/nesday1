import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesday1/cores/app_constant.dart';
import 'package:nesday1/widgets/form_wiget.dart';
import 'package:nesday1/widgets/image_wiget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 80),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SizedBox(width: Get.width * 0.8, child: ImageWiget())],
                ),
            
                SizedBox(height: 16),
            
                Text(AppConstant.appName, style: AppConstant.h2Style()),

                SizedBox(height: 16),

                Container(margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      FormWiget(hint: 'Username', suffixIcon: Icon(Icons.person_outline),),
                      
                      SizedBox(height: 16),
                      
                      FormWiget(hint: 'Password',),
                    ],
                  ),
                ),
            
                Text('button login'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
