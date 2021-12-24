
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/pages/widgets/header_widget.dart';
import 'package:charts_flutter/flutter.dart' as charts;



class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key:key);

  @override
  _HomePageState createState() => _HomePageState();
  
}

class PieData {
  PieData(this.activity, this.time);
    String activity;
    double time;
    
}


class _HomePageState extends State<HomePage>{
  double _headerHeight = 150;
  Key _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;
  late List<charts.Series<PieData, String>> _pieData;

  @override void initState() {
    super.initState();
    _pieData = <charts.Series<PieData, String>>[];
}

    generateData() {
        var piedata = [
            new PieData('Work', 35.8),
            new PieData('Eat', 8.3),
            new PieData('Commute', 10.8),
            new PieData('TV', 15.6),
            new PieData('Sleep', 19.2),
            new PieData('Other', 10.3),
        ];
    _pieData.add(
        charts.Series(
            domainFn: (PieData data, _) => data.activity,
            measureFn: (PieData data, _) => data.time,
            id: 'Time spent',
            data: piedata,
            labelAccessorFn: (PieData row, _) => '${row.activity}',
        ),
    );
    return _pieData;
}

     

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.person), 
            ),
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    Text(
                      'Homepage',
                      style: TextStyle(fontSize: 40,color: Colors.indigoAccent , fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 0.0),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              child: TextField(
                                decoration: ThemeHelper().textInputDecoration('search'),
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 20.0),
                            SizedBox(height: 15.0),
                          ]
                        ),
                    ),
                  ]
                ),
              ),
            ),
          ]
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
            label: 'Business',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}

