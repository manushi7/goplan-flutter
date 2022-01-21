import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/pages/achievement_page.dart';
import 'package:flutter_login_ui/pages/goals_list.dart';
import 'package:flutter_login_ui/pages/goals_page.dart';
import 'package:flutter_login_ui/pages/profile_page.dart';
import 'package:flutter_login_ui/pages/registration_page.dart';
import 'package:flutter_login_ui/pages/reminders_page.dart';
import 'package:flutter_login_ui/services/api_service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

import '../home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int index;
  late List<Widget> _screens;
  late final PageController _controller;
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
    index = 0;

    _screens = [
      HomeScreen(),
      GoalList(),
      Reminder(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text("Welcome, Medani")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: size.height / 4,
                child: Stack(
                  children: [
                    FutureBuilder(
                        future: APIService.getAchievements(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data != null) {
                            return PageView.builder(
                              controller: _controller,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return Center(
                                    child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.all(10),
                                        title: Text(snapshot
                                            .data[index].achievementStatus),
                                        subtitle: Text(snapshot.data[index].goal
                                            .goalDescription)));
                              },
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SmoothPageIndicator(
                        controller: _controller, // PageController
                        count: 4,
                        effect: const WormEffect(
                          dotHeight: 10,
                          dotWidth: 10,
                          dotColor: Colors.white,
                          activeDotColor: Colors.green,
                        ), // your preferred effect
                        onDotClicked: (index) {},
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TableCalendar(
                  availableGestures: AvailableGestures.none,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: size.height / 4,
                width: size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const Text('This is reminder'),
              ),
            ],
          ),
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
}
