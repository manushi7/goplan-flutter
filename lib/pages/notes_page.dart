import 'package:flutter_login_ui/models/goals_response_model.dart';
import 'package:flutter_login_ui/services/api_service.dart';
import 'package:get/state_manager.dart';

class GoalController extends GetxController {
  // ignore: deprecated_member_use
  var goals = List<GoalsResponseModel>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchGoals();
  }

  void fetchGoals() async {
    await Future.delayed(Duration(seconds: 1));
    var goalResult = await APIService.getUserGoals();
    goals.values = goalResult;
  }
}
