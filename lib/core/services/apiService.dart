import 'dart:convert';
import 'dart:io';

import 'package:flutter_login_ui/models/jwtResponseModel.dart';
import 'package:flutter_login_ui/models/userModel.dart';
import 'package:http/http.dart' as http;

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
      } else {
        return JwtResponse();
      }
    } catch (e) {
      return JwtResponse();
    }
    return jwtResponse;
  }
}
