import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';

UserProfile userProfileResponseFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String responseToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile(
      {this.id,
      this.fullName,
      this.email,
      this.dob,
      this.phoneNumber,
      this.employmentStatus,
      this.password});
  int? id;
  String? fullName;
  String? email;
  String? dob;
  String? phoneNumber;
  String? employmentStatus;
  String? password;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
      id: json["id"],
      fullName: json["fullName"],
      email: json["email"],
      dob: json["dob"],
      phoneNumber: json["phoneNumber"],
      employmentStatus: json["employmentStatus"],
      password: json["password"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "dob": dob,
        "phoneNumber": phoneNumber,
        "employmentStatus": employmentStatus,
        "password": password
      };
}
