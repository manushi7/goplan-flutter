import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  PageView.builder(
                    controller: _controller,
                    itemCount: 4,
                    itemBuilder: (context, item) {
                      return Center(child: Text('$item Achivement'));
                    },
                  ),
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
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              child: const Text('This is remonder'),
            ),
          ],
        ),
      ),
    );
  }
}
