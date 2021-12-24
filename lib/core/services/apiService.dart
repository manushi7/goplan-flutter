import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _apiService = ApiService._init();

  factory ApiService(){
    return _apiService;
  }

  ApiService._init();

  Future<http.Response> createUser(User user) async {
    final response = await http.post('yee', {
      headers: {
        HttpHeaders.contentTypeHeader : 'application/json'
      }, 
      body: postToJson()
    })
  }



  
}
