import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nesday1/models/user_model.dart';

class AppService {
  Future<void> checkLogin({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    try {
      String urlAPI = 'https://tns.nso.go.th/hh70/API/authenticate.php';

      Map<String, dynamic> body = {};
      body['username'] = username;
      body['password'] = password;

      Dio objectDio = Dio();
      objectDio.options.headers['Content-Type'] = 'multipart/form-data';

      var response = await objectDio.post(urlAPI, data: FormData.fromMap(body));

      debugPrint('response ===> ${response.toString()}');

      UserModel userModel = UserModel.fromMap(response.data['data']);

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
    }
  }
}
