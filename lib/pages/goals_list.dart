import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/config.dart';
import 'package:flutter_login_ui/models/achievement_request_model.dart';
import 'package:flutter_login_ui/models/notes_request_model.dart';
import 'package:flutter_login_ui/models/notes_response_model.dart';
import 'package:flutter_login_ui/services/api_service.dart';
import 'package:intl/intl.dart';

class GoalList extends StatefulWidget {
  const GoalList({Key? key}) : super(key: key);

  @override
  _GoalListState createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  late final TextEditingController achievementStatus;
  @override
  void initState() {
    achievementStatus = TextEditingController();
    super.initState();
  }

  Widget noteWidget() {
    return FutureBuilder(
        future: APIService.getUserGoals(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Text(snapshot.data[index].goalTitle),
                          subtitle: Text(snapshot.data[index].goalDescription)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(snapshot.data[index].startDate),
                          const SizedBox(width: 8),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: const Text('COMPLETE'),
                            onPressed: () {
                              showSheet(context, snapshot.data[index].id);
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: const Text('SHARE'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ]);
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
      appBar: AppBar(title: Text('Goals')),
      body: noteWidget(),
    );
  }

  void showSheet(BuildContext context, id) {
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
                  controller: achievementStatus,
                  decoration: const InputDecoration(
                      hintText: 'Enter achievement status'),
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
                    if (achievementStatus.text != "") {
                      AchievementRequestModel model = AchievementRequestModel(
                        achievementStatus: achievementStatus.text,
                      );
                      APIService.createAchievement(model, id).then((response) {
                        if (response) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(Config.appName),
                                  content: Text("Congrats !"),
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
