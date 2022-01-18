class GoalModel {
  int id = 0;
  String goalTitle = "";
  String goalDescription = "";
  String createDate = "";
  String startDate = "";
  String toCompleteDate = "";
  String toSetReminder = "";

  GoalModel(
      {required this.id,
      required this.goalTitle,
      required this.goalDescription,
      required this.createDate,
      required this.startDate,
      required this.toCompleteDate,
      required this.toSetReminder});

  factory GoalModel.fromJson(Map<dynamic, dynamic> goalsJson) {
    return GoalModel(
        id: goalsJson['id'],
        goalTitle: goalsJson['goalTitle'],
        goalDescription: goalsJson['goalDescription'],
        createDate: goalsJson['createDate'],
        startDate: goalsJson['startDate'],
        toCompleteDate: goalsJson['toCompleteDate'],
        toSetReminder: goalsJson['toSetReminder']);
  }
}
