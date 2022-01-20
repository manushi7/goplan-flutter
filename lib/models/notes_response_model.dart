import 'dart:convert';

List<NotesResponseModel> notesResponseJson(String str) =>
    List<NotesResponseModel>.from(
        json.decode(str).map((x) => NotesResponseModel.fromJson(x)));

class NotesResponseModel {
  NotesResponseModel({
    required this.id,
    required this.noteTitle,
    this.noteType,
    required this.noteText,
    required this.userId,
  });
  late final int id;
  late final String noteTitle;
  late final Null noteType;
  late final String noteText;
  late final int userId;

  NotesResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noteTitle = json['noteTitle'];
    noteType = null;
    noteText = json['noteText'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['noteTitle'] = noteTitle;
    _data['noteType'] = noteType;
    _data['noteText'] = noteText;
    _data['userId'] = userId;
    return _data;
  }
}
