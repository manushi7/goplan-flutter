class AchievementRequestModel {
  AchievementRequestModel({
    required this.achievementStatus,
  });
  late final String achievementStatus;

  AchievementRequestModel.fromJson(Map<String, dynamic> json) {
    achievementStatus = json['achievementStatus'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['achievementStatus'] = achievementStatus;
    return _data;
  }
}
