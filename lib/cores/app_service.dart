import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppService {
  Future<void> checkLogin({
    required String username,
    required String password,
  }) async {



    try {
  String urlAPI = 'https://tns.nso.go.th/hh70/API/authenticate.php';
  
  Map<String, dynamic> body= {};
  body['username'] = username;
  body['password'] = password;
  
  Dio objectDio = Dio();
  objectDio.options.headers['Content-Type'] = 'multipart/form-data';
  
  var response = await objectDio.post(urlAPI, data: FormData.fromMap(body));

  debugPrint('response ===> ${response.toString()}');


} on Exception catch (e) {
  debugPrint('e ===> ${e.toString()}');
}

  }
}
