import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';

User responseFromJson(String str) => User.fromJson(json.decode(str));

String responseToJson(User data) => json.encode(data.toJson());

class User {
  User({this.email, this.password});
  String? email;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
