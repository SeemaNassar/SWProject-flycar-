import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flycar/ProfilePages/page/profile_page.dart';
import 'package:flycar/Taxi/Taxi.dart';
import '../konstants.dart';
import 'appbar.dart';
import 'calendar_page/calender_page.dart';
import 'rent.dart';
import 'package:flycar/common/theme_helper.dart';
import 'package:flycar/sharedPrefs.dart';
import 'package:flycar/pages/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: first(),
  ));
}

class first extends StatelessWidget {
   double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    var s=SessionManager().get("emailSession");
    // ignore: avoid_print
    print("**"+s.toString());
    //var gray;
    return Scaffold(
            backgroundColor: kBgColor,
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Color.fromRGBO(49, 81, 113, 1)),
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
     drawer:Bar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'halter',
                          
                          package: 'flutter_credit_card',
                      color: Color.fromRGBO(49, 81, 113, 1),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ), //sizebox
                  Text(
                    "What service do you need?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'halter',
                          
                          package: 'flutter_credit_card',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(49, 81, 113, 1),
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Center(
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('assets/images/first.jpg'),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 44, 84, 103).withOpacity(0.3),
                        blurRadius: 2.0,
                        offset: Offset(5.0, 3.0),
                        spreadRadius: 2.0,
                      )
                    ]),
                /////
                //decoration: BoxDecoration(
                // image: DecorationImage(
                //   image:// NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fvector%2Ftaxi-service-app-design-mobile-phone-order-taxi-app-illustration-service-driver-gm1308670485-398586512&psig=AOvVaw0ZAF7cve0Z4u3jJq2WGGOO&ust=1664905839258000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJDjqonQxPoCFQAAAAAdAAAAABAf'),
                //  AssetImage("assets/images/first.jpg")
                //   )),
              ),
              Column(
                children: <Widget>[
                  // the order button
                  Container(
                    height: 60,
                    width: double.infinity,
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child:   ElevatedButton(
                   style: ThemeHelper().buttonStyle(),
                    //minWidth: double.infinity,
                    //height: 60,
                    
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>Taxi()));
                    },
                    // defining the shape
                    // shape: RoundedRectangleBorder(
                    //     side: BorderSide(color: Colors.black),
                    //     borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                   child:  Text("Ordar Taxi", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white,fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',),),
                      
                     ),
                  
                  ),
                            ),
                  ///
                SizedBox(height: 20),
                  // creating the signup button
                   Container(
                    height: 60,
                    width: double.infinity,
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child:   ElevatedButton(
                   style: ThemeHelper().buttonStyle(),
                    //minWidth: double.infinity,
                    //height: 60,
                    
                   onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CalendarPage()));
                    },
                    // defining the shape
                    // shape: RoundedRectangleBorder(
                    //     side: BorderSide(color: Colors.black),
                    //     borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                   child:  Text("Rent Car", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.white,fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',),),
                                
                     ),
                  
                  ),
                            ),
                            ///////////////
                  
                  // MaterialButton(
                  //   minWidth: double.infinity,
                  //   height: 60,
                  //   onPressed: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => rented()));
                  //   },
                  //   color: Color.fromRGBO(49, 81, 113, 1),
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(50)),
                  //   child: Text(
                  //     "Rent Car",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 18),
                  //   ),
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
