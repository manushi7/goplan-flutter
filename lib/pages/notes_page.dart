import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/config.dart';
import 'package:flutter_login_ui/models/notes_request_model.dart';
import 'package:flutter_login_ui/models/notes_response_model.dart';
import 'package:flutter_login_ui/services/api_service.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late final TextEditingController noteTitle;
  late final TextEditingController noteText;
  @override
  void initState() {
    noteTitle = TextEditingController();
    noteText = TextEditingController();
    super.initState();
  }

  Widget noteWidget() {
    return FutureBuilder(
        future: APIService.getUserNotes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(snapshot.data[index].noteTitle),
                      subtitle: Text(snapshot.data[index].noteText)),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: noteWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showSheet(context);
        },
      ),
    );
  }

  void showSheet(BuildContext context) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: noteTitle,
                  decoration:
                      const InputDecoration(hintText: 'Enter note title'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: noteText,
                  decoration:
                      const InputDecoration(hintText: 'Enter note description'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      'Save'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    if (noteTitle.text != "" && noteText.text != "") {
                      NotesRequestModel model = NotesRequestModel(
                        noteTitle: noteTitle.text,
                        noteText: noteText.text,
                      );
                      APIService.createNotes(model).then((response) {
                        if (response) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(Config.appName),
                                  content: Text("Notes have been added"),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"))
                                  ],
                                );
                              });
                          setState(() => {});
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(Config.appName),
                                  content: Text("Something went wrong !"),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"))
                                  ],
                                );
                              });
                        }
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(Config.appName),
                              content: Text("Please fill all the fields"),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
