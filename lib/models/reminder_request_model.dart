class ReminderRequestModel {
  ReminderRequestModel({
    required this.reminderTitle,
    required this.createDate,
    required this.remindDate,
  });
  late final String reminderTitle;
  late final String createDate;
  late final String remindDate;

  ReminderRequestModel.fromJson(Map<String, dynamic> json) {
    reminderTitle = json['reminderTitle'];
    createDate = json['createDate'];
    remindDate = json['remindDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['reminderTitle'] = reminderTitle;
    _data['createDate'] = createDate;
    _data['remindDate'] = remindDate;
    return _data;
  }
}
