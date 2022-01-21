import 'dart:convert';

import 'package:flutter_login_ui/config.dart';
import 'package:flutter_login_ui/models/achievement_request_model.dart';
import 'package:flutter_login_ui/models/achievement_response_model.dart';
import 'package:flutter_login_ui/models/goals_request_model.dart';
import 'package:flutter_login_ui/models/goals_response_model.dart';
import 'package:flutter_login_ui/models/login_request_model.dart';
import 'package:flutter_login_ui/models/login_response_model.dart';
import 'package:flutter_login_ui/models/notes_request_model.dart';
import 'package:flutter_login_ui/models/notes_response_model.dart';
import 'package:flutter_login_ui/models/register_request_model.dart';
import 'package:flutter_login_ui/models/reminder_request_model.dart';
import 'package:flutter_login_ui/models/reminder_response_model.dart';
import 'package:flutter_login_ui/models/userprofile_response_model.dart';
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

  static Future<UserprofileResponseModel> getUserProfile() async {
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
    return userProfileResponseJson(response.body);
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
    if (response.statusCode == 200) {
      return goalResponseJson(response.body);
    }
    return [];
  }

  static Future<bool> createGoal(GoalsRequestModel model) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.accessToken}'
    };
    var url = Uri.http(Config.apiURL, Config.createGoalsAPI);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<NotesResponseModel>> getUserNotes() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.accessToken}'
    };

    var url = Uri.http(Config.apiURL, Config.notesAPI);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      return notesResponseJson(response.body);
    }
    return [];
  }

  static Future<bool> createNotes(NotesRequestModel model) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.accessToken}'
    };
    var url = Uri.http(Config.apiURL, Config.createNotesAPI);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> createAchievement(
      AchievementRequestModel model, id) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.accessToken}'
    };
    var url =
        Uri.parse("http://go-plan.herokuapp.com/api/achievements/create/${id}");
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> createReminder(ReminderRequestModel model) async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.accessToken}'
    };
    var url = Uri.http(Config.apiURL, Config.createReminderAPI);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<ReminderResponseModel>> getReminder() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.accessToken}'
    };
    var url = Uri.http(Config.apiURL, Config.reminderAPI);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      print(response.body);

      return reminderResponseJson(response.body);
    }
    return [];
  }

  static Future<List<AchievementResponseModel>> getAchievements() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails!.accessToken}'
    };
    var url = Uri.http(Config.apiURL, Config.achievementAPI);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      print(response.body);

      return achievementResponseJson(response.body);
    }
    return [];
  }
}
