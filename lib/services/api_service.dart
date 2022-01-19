import 'dart:convert';

import 'package:flutter_login_ui/config.dart';
import 'package:flutter_login_ui/models/goals_response_model.dart';
import 'package:flutter_login_ui/models/login_request_model.dart';
import 'package:flutter_login_ui/models/login_response_model.dart';
import 'package:flutter_login_ui/models/register_request_model.dart';
import 'package:flutter_login_ui/services/shared_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.loginAPI);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 201) {
      print(response);
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      print(response);
      return false;
    }
  }

  static Future<bool> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.registerAPI);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> validateToken() async {
    if (await SharedService.isLoggedIn() == false) {
      return false;
    }
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.accessToken}'
    };

    var url = Uri.http(Config.apiURL, Config.profileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.accessToken}'
    };

    var url = Uri.http(Config.apiURL, Config.profileAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    print(response.body);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  static Future<List<GoalsResponseModel>> getUserGoals() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.accessToken}'
    };

    var url = Uri.http(Config.apiURL, Config.goalsAPI);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    print(response.body);
    if (response.statusCode == 200) {
      return goalResponseJson(response.body);
    }
    return [];
  }
}
