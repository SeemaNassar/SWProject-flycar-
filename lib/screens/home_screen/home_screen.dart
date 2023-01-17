import 'package:flycar/ProfilePages/page/profile_page.dart';
import 'package:flycar/konstants.dart';
import 'package:flycar/pages/appbar.dart';
import 'package:flycar/pages/firstpage.dart';
import 'package:flycar/size_config.dart';
import 'package:flutter/material.dart';
import 'homebody.dart';
import 'package:flycar/sharedPrefs.dart';
import 'package:flycar/pages/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  double  _drawerIconSize = 24;

  double _drawerFontSize = 17;

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Text(
          "Available Cars ",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Color.fromRGBO(49, 81, 113, 1),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
      ),
      drawer: Bar(),
     
      body: SafeArea(
        child: HomeBody(),
      ),
     // bottomNavigationBar: CustomBottomNavBAr(),
    );
  }
}

