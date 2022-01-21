import 'dart:convert';

List<AchievementResponseModel> achievementResponseJson(String str) =>
    List<AchievementResponseModel>.from(
        json.decode(str).map((x) => AchievementResponseModel.fromJson(x)));

class AchievementResponseModel {
  AchievementResponseModel({
    required this.id,
    required this.achievementStatus,
    required this.goalId,
    required this.userId,
    required this.goal,
  });
  late final int id;
  late final String achievementStatus;
  late final int goalId;
  late final int userId;
  late final Goal goal;

  AchievementResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    achievementStatus = json['achievementStatus'];
    goalId = json['goalId'];
    userId = json['userId'];
    goal = Goal.fromJson(json['goal']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['achievementStatus'] = achievementStatus;
    _data['goalId'] = goalId;
    _data['userId'] = userId;
    _data['goal'] = goal.toJson();
    return _data;
  }
}

class Goal {
  Goal({
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

  Goal.fromJson(Map<String, dynamic> json) {
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
