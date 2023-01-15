
import 'package:flycar/ProfilePages/page/profile_page.dart';
import 'package:flycar/pages/appbar.dart';
import 'package:flycar/pages/car_details/card_details_widgets/rental_info.dart';
// import 'package:car_rental/shared_widgets/appbar.dart';
import 'package:flycar/pages/car_details/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flycar/pages/firstpage.dart';
import 'package:flycar/pages/login_page.dart';
import 'package:flycar/pages/splash_screen.dart';
import 'package:flycar/screens/home_screen/homebody.dart';
import 'calendar_widgets/calendar.dart';
import 'package:flycar/screens/home_screen/home_screen.dart';
import 'package:flycar/sharedPrefs.dart';
class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _servicio = new ServicioSingleton();
 double _drawerIconSize = 24;

  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromRGBO(49, 81, 113, 1),
      // appBar: AppBar(
      //   elevation: 0.3,
      //   backgroundColor: Color.fromRGBO(49, 81, 113, 1),
      //   foregroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.white),
      //   title: Text("Select date and time "),
        
       
      // ),
        appBar: AppBar(
        title: Text(
          "Select Dates",
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
      drawer: Bar(),
     
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        
          child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Column(
            children: [
              CalendarSelectionRange(),
              rentalInfo(),
              ElevatedButton(
                  onPressed: () {
                    _servicio.diaINICIO.value == null &&
                            _servicio.diaFIN.value == null
                        ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Select start and end dates to continue',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.all(16),
                          ))
                        :{
                           Navigator.of(context)
                            .push(CupertinoPageRoute(builder: (context) {
                            return HomeScreen();
                          }))};
                    //Navigator.pushNamed(context, '/carSelectionPage');
                    print(' day start ${_servicio.diaINICIO}');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(209, 35, 61, 86)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                        
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue',
                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',),
                        textAlign: TextAlign.center,
                      ),
                    ],
                 
                  )
                  )
            ],
          ),
        ],
      )),
    );
  }
}
