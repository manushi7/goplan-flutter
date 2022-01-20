class NotesRequestModel {
  NotesRequestModel({
    required this.noteTitle,
    required this.noteText,
  });
  late final String noteTitle;
  late final String noteText;

  NotesRequestModel.fromJson(Map<String, dynamic> json) {
    noteTitle = json['noteTitle'];
    noteText = json['noteText'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['noteTitle'] = noteTitle;
    _data['noteText'] = noteText;
    return _data;
  }
}
