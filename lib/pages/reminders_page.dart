import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/config.dart';
import 'package:flutter_login_ui/models/goals_request_model.dart';
import 'package:flutter_login_ui/models/goals_response_model.dart';
import 'package:flutter_login_ui/models/reminder_request_model.dart';
import 'package:flutter_login_ui/services/api_service.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  late final TextEditingController reminderTitle;
  late final TextEditingController createDate;
  late final TextEditingController remindDate;

  late bool setReminder;
  @override
  void initState() {
    setReminder = false;
    reminderTitle = TextEditingController();
    createDate = TextEditingController();
    remindDate = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config.appName),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: noteWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showSheet(context);
        },
      ),
    );
  }

  Widget noteWidget() {
    return FutureBuilder(
        future: APIService.getReminder(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Text(snapshot.data[index].reminderTitle),
                          subtitle: Text(snapshot.data[index].remindDate)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(snapshot.data[index].startDate),
                          const SizedBox(width: 8),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.green,
                            ),
                            child: const Text('DELETE'),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ]);
              },
            );
          } else {
            return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  title: Text("Complete flutter project"),
                  subtitle: Text("Submit project in time")),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("2022-01-21"),
                  const SizedBox(width: 8),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: const Text('DELETE'),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ]);
          }
        });
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
                  controller: reminderTitle,
                  decoration:
                      const InputDecoration(hintText: 'Enter reminder title'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: createDate,
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Enter Create Date"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        setState(() {
                          createDate.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        });
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: remindDate,
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Enter Start Date"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        setState(() {
                          remindDate.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        });
                      }
                    }),
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
                    if (reminderTitle.text != "" &&
                        createDate.text != "" &&
                        remindDate.text != "") {
                      ReminderRequestModel model = ReminderRequestModel(
                          reminderTitle: reminderTitle.text,
                          createDate: createDate.text,
                          remindDate: remindDate.text);
                      APIService.createReminder(model).then((response) {
                        if (response) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(Config.appName),
                                  content: Text("Reminder have been added"),
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
