import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) =>
    ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  ErrorResponse({this.statusCode, this.message});
  int? statusCode;
  String? message;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      ErrorResponse(statusCode: json["statusCode"], message: json["message"]);

  Map<String, dynamic> toJson() =>
      {"statusCode": statusCode, "message": message};
}
