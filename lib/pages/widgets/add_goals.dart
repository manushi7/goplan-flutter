import 'package:flutter/material.dart';
import 'package:flutter_login_ui/models/goals_request_model.dart';

class AddGoalPage extends StatefulWidget {
  late final GoalsRequestModel? goal;

  AddGoalPage({
    Key? key,
    this.goal
  })

  @override
  _AddGoalPageState createState() => _AddGoalPageState();
}

class _AddGoalPageState extends State<AddGoalPage> {
  late DateTime createDate;
  late DateTime startDate;
  late DateTime toCompleteDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        leading : CloseButton(),
        actions : buildEditingActions(),
      )
    );

    List<Widget> buildEditingActions() => [];

  }
}
