// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesday1/cores/app_controller.dart';

import 'package:nesday1/models/user_model.dart';
import 'package:nesday1/widgets/assign_body.dart';
import 'package:nesday1/widgets/profile_body.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  List<String> title = <String>['Asignment', 'Profile'];

  List<IconData> icon = <IconData>[Icons.assignment, Icons.person];

  AppController appController = Get.put(AppController());

  List<BottomNavigationBarItem> items = [];

  List<Widget> bodys = <Widget>[];

  @override
  void initState() {
    super.initState();

    bodys.add(AssignBody(userModel: widget.userModel));
    bodys.add(ProfileBody(userModel: widget.userModel));

    for (var i = 0; i < title.length; i++) {
      items.add(BottomNavigationBarItem(icon: Icon(icon[i]), label: title[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: Text(title[appController.indexBody.value])),

        body: bodys[appController.indexBody.value],

        bottomNavigationBar: BottomNavigationBar(
          items: items,
          currentIndex: appController.indexBody.value,
          onTap: (value) {
            appController.indexBody.value = value;
          },
        ),
      ),
    );
  }
}
