
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/pages/friend.dart';
import 'goals_page.dart';
import '../home_page.dart';
import 'package:flutter_login_ui/pages/widgets/header_widget.dart';
import 'achievement_page.dart';
import 'registration_page.dart';

class ProfilePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
     return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage>{

  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme:IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                    constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
                    child: Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
            color: Colors.white,
              
          ) ,
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
                leading: Icon(Icons.screen_lock_landscape_rounded, size: _drawerIconSize, color: Colors.black,),
                title: Text('Home Page', style: TextStyle(fontSize: 17, color: Colors.black),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.login_rounded,size: _drawerIconSize,color: Colors.black),
                title: Text('my goals', style: TextStyle(fontSize: _drawerFontSize, color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GoalScreen()),);
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.person_add_alt_1, size: _drawerIconSize,color: Colors.black),
                title: Text('Registration Page',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()),);
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.password_rounded, size: _drawerIconSize,color: Colors.black,),
                title: Text(' my achievements',style: TextStyle(fontSize: _drawerFontSize,color: Colors.black),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => CardDesign()),);
                },
              ),
              //Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.verified_user_sharp, size: _drawerIconSize,color: Colors.black,),
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(height: 100, child: HeaderWidget(100,false,Icons.house_rounded),),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 100, offset: const Offset(5, 5),),
                      ],
                    ),
                    child: Icon(Icons.person, size: 80, color: Colors.grey.shade300,),
                  ),
                  SizedBox(height: 20,),
                  Text('Manushi Khadka', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text('student', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "User Information",
                            style: TextStyle(
                              color: Colors.indigoAccent,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.my_location),
                                          title: Text("EmployementStatus"),
                                          subtitle: Text("student"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle: Text("manushi123@gmail.com"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text("0000000000"),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text("Date of Birth"),
                                          subtitle: Text(
                                              "2001/08/28"),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}