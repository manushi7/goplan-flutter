import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/pages/goals_page.dart';
import 'package:flutter_login_ui/pages/login_page.dart';
import 'package:flutter_login_ui/pages/profile_page.dart';
import 'package:flutter_login_ui/pages/reminders_page.dart';
import 'package:flutter_login_ui/pages/settings.dart';
import 'package:flutter_login_ui/pages/widgets/header_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_login_ui/services/api_service.dart';

import 'models/userprofile_response_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class PieData {
  PieData(this.activity, this.time);
  String activity;
  double time;
}

class _HomePageState extends State<HomePage> {
  double _headerHeight = 150;
  late int index;
  late List<Widget> _screens;
  Key _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;
  late List<charts.Series<PieData, String>> _pieData;

  @override
  void initState() {
    super.initState();
    index = 0;

    _screens = [
      HomePage(),
      Goal(),
      Reminder(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.person),
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: userData()),
            ),
            SafeArea(child: Container(child: goalsWidget()))
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.badge_rounded),
              label: 'Goals',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Reminder',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'User Profile',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: index,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          onTap: (value) {
            setState(() {
              index = value;
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _screens[index]),
            );
          },
        ));
  }

  Widget goalsWidget() {
    return FutureBuilder(
        future: APIService.getUserGoals(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data[0].goalTitle);
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(snapshot.data[index].goalTitle),
                      subtitle: Text(snapshot.data[index].goalDescription)),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget userData() {
    return FutureBuilder(
        future: APIService.getUserProfile(),
        builder: (BuildContext context,
            AsyncSnapshot<UserprofileResponseModel> model) {
          return Column(children: [
            Text(
              model.hasData ? "Welcome" + " " + model.data!.fullName : '',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.indigoAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 0.0),
          ]);
        });
  }
}
