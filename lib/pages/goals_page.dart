import 'package:flutter/material.dart';
import 'package:flutter_login_ui/config.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Goal extends StatefulWidget {
  const Goal({Key? key}) : super(key: key);

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  @override
  void initState() {
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
        onPressed: () {},
      ),
    );
  }

  @override
  Widget calenderWidget(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
    );
  }
}
