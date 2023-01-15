

import 'package:flycar/ProfilePages/page/profile_page.dart';
import 'package:flycar/Taxi/send_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flycar/pages/firstpage.dart';
import 'package:flycar/pages/splash_screen.dart';
import 'package:flycar/sharedPrefs.dart';

class Bar extends StatelessWidget {
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                1.0
              ],
                  colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).accentColor.withOpacity(0.5),
              ])),
          child: ListView(
            children: [
         
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Rent & Order",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 188, 182, 182),
                        fontFamily: 'halter',
                          package: 'flutter_credit_card',
                        fontWeight: FontWeight.bold,
                        
                        ),
                       
                  ),
                      decoration: BoxDecoration(

             // shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/company.png'),
                opacity:1.0,
                //scale:0.5,
              ),
            ),
                ),
               
                
              ),
              ListTile(
                leading: Icon(
                  Icons.home_filled,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                  
                ),
                title: Text(
                  'Home Page',
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).accentColor,fontFamily: 'halter',
                         
                          package: 'flutter_credit_card',),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              first()));
                },
              ),
 
              Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
      ListTile(
                leading: Icon(
                  Icons.person,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 18, color: Theme.of(context).accentColor,fontFamily: 'halter',
                          package: 'flutter_credit_card',),
                ),
                onTap: () {
                  
                  Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context) => ProfilePage()),);
                },
                
              ),
               Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.feedback_outlined,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  "Send feedback",
                  style: TextStyle(
                      //fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor ,fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',),
                ),
                onTap: () {
                  sharedPrefs.saveEmail('','');
                  sharedPrefs.saveDates('', '', '');
                  sharedPrefs.savewall('');
               
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rating()),
                  );
                  //SystemNavigator.pop();
                },
              ),
                 Divider(
                color: Theme.of(context).primaryColor,
                height: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  size: _drawerIconSize,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                      //fontSize: _drawerFontSize,
                      color: Theme.of(context).accentColor ,fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',),
                ),
                onTap: () {
                  sharedPrefs.saveEmail('','');
                  sharedPrefs.saveDates('', '', '');
                  sharedPrefs.savewall('');
               
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen(title:"FlyCar")),
                  );
                  //SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      );
     
    
  }
}


