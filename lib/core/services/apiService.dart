import 'dart:convert';
import 'dart:io';

import 'package:flutter_login_ui/models/errorResponseModel.dart';
import 'package:flutter_login_ui/models/jwtResponseModel.dart';
import 'package:flutter_login_ui/models/profileModel.dart';
import 'package:flutter_login_ui/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static final ApiService _apiService = ApiService._init();

  factory ApiService() {
    return _apiService;
  }

  ApiService._init();

  Future<JwtResponse> loginUser(User user) async {
    final request = await http.post(
        Uri.parse('https://go-plan.herokuapp.com/api/user/login'),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(user.toJson()));
    JwtResponse jwtResponse = JwtResponse();
    try {
      if (request.statusCode == 201) {
        print(request.body);
        jwtResponse = jwtResponseFromJson(request.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = jwtResponse.access_token;
        await prefs.setString('jwt', token);
      } else {
        return JwtResponse();
      }
    } catch (e) {
      print(e);
      return JwtResponse();
    }
    return jwtResponse;
  }

  Future<UserProfile> getProfile() async {
    print("Hitting");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt');
    final request = await http.get(
        Uri.parse('https://go-plan.herokuapp.com/api/user/profile'),
        headers: {"Authorization": token != null ? token : ''});
    UserProfile userProfile = UserProfile();
    if (request.statusCode == 200) {
      userProfile = json.decode(request.body);
      print(userProfile);
      return userProfile;
    } else {
      print(request.statusCode);
      throw Exception("Errorfdfd");
    }
  }
}
