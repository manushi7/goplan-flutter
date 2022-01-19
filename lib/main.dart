import 'package:flutter/material.dart';
import 'package:flutter_login_ui/home_page.dart';
import 'package:flutter_login_ui/pages/goals_page.dart';
import 'package:flutter_login_ui/services/api_service.dart';
import 'pages/login_page.dart';
import 'package:flutter_login_ui/pages/profile_page.dart';
import 'package:flutter_login_ui/pages/registration_page.dart';
import 'package:flutter_login_ui/services/shared_service.dart';
import 'package:hexcolor/hexcolor.dart';

import 'pages/splash_screen.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  print("Heeeeeee");

  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await APIService.validateToken();
  print(_result);
  if (_result) {
    print("Heee");
    _defaultHome = const ProfilePage();
  }
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = HexColor('#DC54FE');
  Color _accentColor = HexColor('#5AD3BC');

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      routes: {
        '/': (context) => const LoginPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegistrationPage(),
        '/profile': (context) => const ProfilePage(),
        '/goals': (context) => const Goal()
      },
    );
  }
}
