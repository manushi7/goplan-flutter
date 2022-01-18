class GoalsRequestModel {
  GoalsRequestModel({
    required this.goalTitle,
    required this.goalDescription,
    required this.createDate,
    required this.startDate,
    required this.toCompleteDate,
    required this.toSetReminder,
  });
  late final String goalTitle;
  late final String goalDescription;
  late final String createDate;
  late final String startDate;
  late final String toCompleteDate;
  late final bool toSetReminder;

  GoalsRequestModel.fromJson(Map<String, dynamic> json) {
    goalTitle = json['goalTitle'];
    goalDescription = json['goalDescription'];
    createDate = json['createDate'];
    startDate = json['startDate'];
    toCompleteDate = json['toCompleteDate'];
    toSetReminder = json['toSetReminder'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['goalTitle'] = goalTitle;
    _data['goalDescription'] = goalDescription;
    _data['createDate'] = createDate;
    _data['startDate'] = startDate;
    _data['toCompleteDate'] = toCompleteDate;
    _data['toSetReminder'] = toSetReminder;
    return _data;
  }
}
