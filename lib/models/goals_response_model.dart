import 'dart:convert';

import 'package:flutter_login_ui/models/goals_request_model.dart';

List<GoalsResponseModel> goalResponseJson(String str) =>
    List<GoalsResponseModel>.from(
        json.decode(str).map((x) => GoalsResponseModel.fromJson(x)));

class GoalsResponseModel {
  GoalsResponseModel({
    this.id,
    this.goalTitle,
    this.goalDescription,
    this.createDate,
    this.startDate,
    this.toCompleteDate,
    this.toSetReminder,
    this.userId,
  });
  late final int? id;
  late final String? goalTitle;
  late final String? goalDescription;
  late final String? createDate;
  late final String? startDate;
  late final String? toCompleteDate;
  late final bool? toSetReminder;
  late final int? userId;

  GoalsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goalTitle = json['goalTitle'];
    goalDescription = json['goalDescription'];
    createDate = json['createDate'];
    startDate = json['startDate'];
    toCompleteDate = json['toCompleteDate'];
    toSetReminder = json['toSetReminder'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['goalTitle'] = goalTitle;
    _data['goalDescription'] = goalDescription;
    _data['createDate'] = createDate;
    _data['startDate'] = startDate;
    _data['toCompleteDate'] = toCompleteDate;
    _data['toSetReminder'] = toSetReminder;
    _data['userId'] = userId;
    return _data;
  }
}
