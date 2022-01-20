import 'dart:convert';

List<ReminderResponseModel> goalResponseJson(String str) =>
    List<ReminderResponseModel>.from(
        json.decode(str).map((x) => ReminderResponseModel.fromJson(x)));

class ReminderResponseModel {
  ReminderResponseModel({
    required this.id,
    required this.reminderTitle,
    required this.createDate,
    required this.remindDate,
    required this.goalId,
    required this.userId,
  });
  late final int id;
  late final String reminderTitle;
  late final String createDate;
  late final String remindDate;
  late final int goalId;
  late final int userId;

  ReminderResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reminderTitle = json['reminderTitle'];
    createDate = json['createDate'];
    remindDate = json['remindDate'];
    goalId = json['goalId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['reminderTitle'] = reminderTitle;
    _data['createDate'] = createDate;
    _data['remindDate'] = remindDate;
    _data['goalId'] = goalId;
    _data['userId'] = userId;
    return _data;
  }
}
