import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesday1/models/assign_code_model.dart';
import 'package:nesday1/models/building_code_model.dart';
import 'package:nesday1/models/user_model.dart';
import 'package:nesday1/states/main_home.dart';

class AppService {

  Future<List<BuildingCodeModel>> findBuildList({required String assignCode}) async {

    List<BuildingCodeModel> buildingCodemodels = [];

    return buildingCodemodels;

  }

  Future<List<AssignCodeModel>> findListAssignCodeModel({
    required UserModel userModel,
  }) async {
    List<AssignCodeModel> assignCodemodels = [];

    for (var element in userModel.AssignCodes) {
      AssignCodeModel assignCodeModel = AssignCodeModel.fromMap(element);
      assignCodemodels.add(assignCodeModel);
    }

    return assignCodemodels;
  }

  Future<void> checkLogin({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    try {
      String urlAPI = 'https://tns.nso.go.th/hh70/API/v2/authenticate.php';

      Map<String, dynamic> body = {};
      body['username'] = username;
      body['password'] = password;

      dio.Dio objectDio = dio.Dio();
      objectDio.options.headers['Content-Type'] = 'multipart/form-data';

      var response = await objectDio.post(
        urlAPI,
        data: dio.FormData.fromMap(body),
      );

      debugPrint('response ===> ${response.toString()}');

      UserModel userModel = UserModel.fromMap(response.data['data']);

      debugPrint('AssignCode ===> ${userModel.AssignCodes}');

      Get.offAll(MainHome(userModel: userModel));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Welcome ${userModel.Fullname}',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: const Color.fromARGB(255, 93, 161, 220),
          duration: Duration(seconds: 5),
        ),
      );
    } on Exception catch (e) {
      debugPrint('e ===> ${e.toString()}');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'ไม่สามารถเข้าระบบได้',
            style: TextStyle(color: const Color.fromARGB(255, 236, 19, 19)),
          ),
          backgroundColor: const Color.fromARGB(255, 232, 239, 246),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}
