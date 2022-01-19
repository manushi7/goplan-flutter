import 'package:flutter/material.dart';
import 'package:flutter_login_ui/config.dart';
import 'package:flutter_login_ui/models/goals_response_model.dart';
import 'package:flutter_login_ui/services/api_service.dart';
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
    return FutureBuilder(
        future: APIService.getUserGoals(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return SafeArea(
                child: Container(
                    child: SfCalendar(
              view: CalendarView.month,
              initialDisplayDate: DateTime.now(),
              dataSource: snapshot.data,
            )));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class GoalDataSource extends CalendarDataSource {
  GoalDataSource(List<GoalsResponseModel> goals) {
    goals = goals;
  }

  @override
  DateTime getCreateDate(int index) {
    return goals![index].createDate;
  }

  @overide 
  DateTime 
} 
