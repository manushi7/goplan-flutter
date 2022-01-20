import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/pages/profile_page.dart';
import 'achievement_page.dart';
import 'appblock/appblock.dart';
import 'friends/friend.dart';
import 'goals_page.dart';
import '../home_page.dart';
import 'settings.dart';
import 'reminders_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late int index;
  late List<Widget> _screens;
  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;
  @override
  void initState() {
    super.initState();
    index = 0;
    _screens =  [
      HomePage(),
      FriendPage(),
      Goal(),
      SettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hello Manushi'),
        backgroundColor: Colors.lightBlueAccent,
      ),
       drawer: Drawer(
        child: Container(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text("Your Go Plans",
                    style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_add_alt_1, size: _drawerIconSize, color: Colors.black,),
                title: Text('add friends', style: TextStyle(fontSize: 17, color: Colors.black),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FriendPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.login_rounded,size: _drawerIconSize,color: Colors.black),
                title: Text('my achievements', style: TextStyle(fontSize: _drawerFontSize, color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CardDesign()),);
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.person, size: _drawerIconSize,color: Colors.black),
                title: Text('your profile',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.password_rounded, size: _drawerIconSize,color: Colors.black,),
                title: Text(' my blocked apps',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => appblock()),);
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.verified_user_sharp, size: _drawerIconSize,color: Colors.black,),
                title: Text('create reminder',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => Reminder()), );
                },
              ),

              ListTile(
                leading: Icon(Icons.person_add_alt_1, size: _drawerIconSize,color: Colors.black,),
                title: Text('Friends Page',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => FriendPage()), );
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Colors.black,),
                title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
             
            
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: _screens[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) => setState(() {
          index = value;
        }),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge_outlined),
            label: 'Goal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}