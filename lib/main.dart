import 'package:flutter/material.dart';
import 'package:flycar/pages/rent.dart';
import 'package:flycar/screens/home_screen/home_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/splash_screen.dart';
import 'package:flycar/sharedPrefs.dart';
import 'package:flycar/pages/calendar_page/calender_page.dart';
///
late SharedPreferences prefs;
Future main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
 

 runApp(LoginUiApp());
  prefs = await SharedPreferences.getInstance();
 
}


class LoginUiApp extends StatefulWidget {
  @override
  State<LoginUiApp> createState() => _LoginUiAppState();
}

class _LoginUiAppState extends State<LoginUiApp> {
// #afceed #233d56
  Color _primaryColor = HexColor('#bed9f3');

  Color _accentColor = HexColor('#233d56');

  // Design color
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent And Order taxi',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: 
      SplashScreen(title: 'FlyCar',),
    
    );
  }
}
