import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:myapp/DataModels/employeesDM.dart';

import 'controller.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<employeesDM> getEmployees() async {
    final response = await http.get('${URLS.BASE_URL}/employees');
    if (response.statusCode == 200) {
      Map<String,dynamic> km= json.decode(response.body);
     employeesDM new1=  employeesDM.fromJson(km);
      return new1;
    } else {
      return null;
    }
  }

  static Future<bool> addEmployee(body) async {
    final response = await http.post('${URLS.BASE_URL}/create', body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<employeesDM> getEmployees1() async
  {
    Dio dio = new Dio();
    final  response = await dio.get('${URLS.BASE_URL}/employees');
    if (response.statusCode == 200) {
      Map<String,dynamic> km= json.decode(response.toString());
      employeesDM new1=  employeesDM.fromJson(km);
      return new1;
    } else {
      return null;
    }
  }

}