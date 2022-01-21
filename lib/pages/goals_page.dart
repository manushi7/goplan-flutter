import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/config.dart';
import 'package:flutter_login_ui/models/goals_request_model.dart';
import 'package:flutter_login_ui/models/goals_response_model.dart';
import 'package:flutter_login_ui/services/api_service.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Goal extends StatefulWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  late final TextEditingController _titleController;

  late final TextEditingController _descriptionController;
  late final TextEditingController _createDateController;
  late final TextEditingController _startDateController;
  late final TextEditingController _completeDateController;
  late final TextEditingController _reminderDateController;
  late bool setReminder;
  @override
  void initState() {
    setReminder = false;
    _descriptionController = TextEditingController();
    _createDateController = TextEditingController();
    _startDateController = TextEditingController();
    _completeDateController = TextEditingController();
    _reminderDateController = TextEditingController();
    _titleController = TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config.appName),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: calenderWidget(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showSheet(context);
        },
      ),
    );
  }

  @override
  Widget calenderWidget(BuildContext context) {
    return FutureBuilder(
        future: APIService.getUserGoals(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return SafeArea(
                child: Container(
                    child: SfCalendar(
              view: CalendarView.month,
              monthViewSettings: MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
              initialDisplayDate: DateTime.now(),
              dataSource: GoalDataSource(snapshot.data),
            )));
          } else {
            return const Center(child: CircularProgressIndicator());
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
                  controller: _titleController,
                  decoration:
                      const InputDecoration(hintText: 'Enter goal title'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _descriptionController,
                  decoration:
                      const InputDecoration(hintText: 'Enter description'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: _createDateController,
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
                          _createDateController.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        });
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: _startDateController,
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
                          _startDateController.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        });
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: _completeDateController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Enter to complete Date"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        setState(() {
                          _completeDateController.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        });
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: _reminderDateController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Enter Reminder Date"),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        setState(() {
                          _reminderDateController.text =
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
                    if (_titleController.text != "" &&
                        _descriptionController.text != "" &&
                        _createDateController.text != "" &&
                        _startDateController.text != "" &&
                        _completeDateController.text != "") {
                      GoalsRequestModel model = GoalsRequestModel(
                          goalTitle: _titleController.text,
                          goalDescription: _descriptionController.text,
                          createDate: _createDateController.text,
                          startDate: _startDateController.text,
                          toCompleteDate: _completeDateController.text,
                          toSetReminder: false);
                      APIService.createGoal(model).then((response) {
                        if (response) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(Config.appName),
                                  content: Text("Goals have been added"),
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

class GoalDataSource extends CalendarDataSource {
  GoalDataSource(List<GoalsResponseModel> goals) {
    appointments = goals;
  }

  @override
  DateTime getStartTime(int index) {
    return DateTime.parse(appointments![index].startDate);
  }

  @override
  DateTime getEndTime(int index) {
    return DateTime.parse(appointments![index].toCompleteDate);
  }

  @override
  String getSubject(int index) {
    return appointments![index].goalTitle as String;
  }

  @override
  bool isAllDay(int index) {
    return true;
  }

  @override
  Color getColor(int index) {
    return Colors.green;
  }
}
