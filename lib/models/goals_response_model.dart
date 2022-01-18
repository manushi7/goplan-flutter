import 'dart:convert';

GoalsResponseModel goalResponseJson(String str) =>
    GoalsResponseModel.fromJson(json.decode(str));

class GoalsResponseModel {
  GoalsResponseModel({
    required this.id,
    required this.goalTitle,
    required this.goalDescription,
    required this.createDate,
    required this.startDate,
    required this.toCompleteDate,
    required this.toSetReminder,
    required this.userId,
  });
  late final int id;
  late final String goalTitle;
  late final String goalDescription;
  late final String createDate;
  late final String startDate;
  late final String toCompleteDate;
  late final bool toSetReminder;
  late final int userId;

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
