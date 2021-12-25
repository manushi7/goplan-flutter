import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';

JwtResponse jwtResponseFromJson(String str) =>
    JwtResponse.fromJson(json.decode(str));

String jwtResponseToJson(JwtResponse data) => json.encode(data.toJson());

class JwtResponse {
  JwtResponse({this.access_token});
  String? access_token;
  bool? success;
  String? msg;

  factory JwtResponse.fromJson(Map<String, dynamic> json) => JwtResponse(
        access_token: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
      };
}
