import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesday1/models/assign_code_model.dart';
import 'package:nesday1/models/building_code_model.dart';
import 'package:nesday1/models/user_model.dart';
import 'package:nesday1/states/main_home.dart';

class AppService {
  Future<List<BuildingCodeModel>> findBuildList({
    required String assignCode,
    required String cookieHeader,
  }) async {
    List<BuildingCodeModel> buildingCodemodels = [];

    String urlAPI = 'https://tns.nso.go.th/hh70/API/building_list.php';

    dio.Dio objectDio = dio.Dio();

    var response = await objectDio.request(
      '$urlAPI?assign_code=$assignCode',
      options: dio.Options(method: 'GET', headers: {'Cookie': cookieHeader}),
    );
    debugPrint('status ===> ${response.statusCode}');
    debugPrint('response ===> ${response.toString()}');

    if (response.data['data'].isEmpty) {

      return [];

    } else {

      for (var element in response.data['data']) {

        BuildingCodeModel model = BuildingCodeModel.fromMap(element);
        buildingCodemodels.add(model);
        
      }
      return buildingCodemodels;
      
    }

    
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

      final cookies = response.headers['set-cookie'];
      debugPrint('cookies ===> $cookies');

      List<String> trueCookies = <String>[];

      for (var element in cookies!) {
        trueCookies.add(element.split(';').first);
      }
      debugPrint('## truecookies ===> $trueCookies');

      final cookieHeader = trueCookies.join('; ');
      debugPrint('## cookiesHeader ===> $cookieHeader');

      UserModel userModel = UserModel.fromMap(response.data['data']);

      Get.offAll(MainHome(userModel: userModel, cookieHeader: cookieHeader));

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
