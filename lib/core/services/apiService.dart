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
        Uri.parse('http://localhost:3000/api/user/login'),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(user.toJson()));
    JwtResponse jwtResponse = JwtResponse();
    try {
      if (request.statusCode == 201) {
        jwtResponse = jwtResponseFromJson(request.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = jwtResponse.access_token;
        await prefs.setString('jwt', token);
      } else {
        return JwtResponse();
      }
    } catch (e) {
      return JwtResponse();
    }
    return jwtResponse;
  }

  Future<UserProfile> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt');
    final request = await http
        .get(Uri.parse('http://localhost:3000/api/user/profile'), headers: {
      "Content-Type:": "application/json",
      "Authorization": token != null ? token : ''
    });
    UserProfile userProfile = UserProfile();
    try {
      if (request.statusCode == 200) {
        userProfile = userProfileResponseFromJson(request.body);
        return userProfile;
      }
    } catch (err) {
      throw err;
    }
    return userProfile;
  }
}
