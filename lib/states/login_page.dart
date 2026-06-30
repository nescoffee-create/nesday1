import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesday1/cores/app_constant.dart';
import 'package:nesday1/cores/app_controller.dart';
import 'package:nesday1/widgets/form_wiget.dart';
import 'package:nesday1/widgets/image_wiget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppController appController = Get.put(
    AppController(),
  ); //นี่คือ instance ของ AppController และนำไปใช้ใน login page

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
                  children: [
                    SizedBox(width: Get.width * 0.8, child: ImageWiget()),
                  ],
                ),

                SizedBox(height: 16),

                Text(AppConstant.appName, style: AppConstant.h2Style()),

                SizedBox(height: 16),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      FormWiget(
                        hint: 'Username',
                        suffixIcon: Icon(Icons.person_outline),
                      ),

                      SizedBox(height: 16),

                      Obx(
                        () => FormWiget(
                          obscureText: appController.redEye.value,
                          hint: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {

                              appController.redEye.value = !appController.redEye.value;


                            },
                            icon: Icon(appController.redEye.value ? Icons.remove_red_eye : Icons.remove_red_eye_outlined), //ตาเปิดปิด

                          ),
                        ),
                      ),
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
