
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/pages/widgets/header_widget.dart';


class Settings extends StatefulWidget{
  const Settings({Key? key}): super(key:key);

  @override
  _SettingsState createState() => _SettingsState();
}



class _SettingsState extends State<Settings>{
  double _headerHeight = 150;
  Key _formKey = GlobalKey<FormState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 20,color: Colors.indigoAccent , fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 0.0),
                  ]
                ),
              ),
            ),
          ]
        ),
      ),
      
    );
  }
}