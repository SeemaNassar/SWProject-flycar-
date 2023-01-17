
import 'dart:collection';
import 'dart:convert';

import 'package:flycar/ProfilePages/page/profile_page.dart';
import 'package:flycar/api/model/company_model.dart';
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
import 'package:http/http.dart' as http;
import '/api/fetchData.dart';
class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}
late List<CompanyModel> allcmp;
late List<String> items;
class _CalendarPageState extends State<CalendarPage> {
   
  
  @override
  void initState() {
   allcmp=[];
   items=[];
     fetchAllCompany();
//dropdownvalue = 'Governorate';
    super.initState();
  }

  // List of items in our dropdown menu
  //var items ;
  final _servicio = new ServicioSingleton();
 double _drawerIconSize = 24;
String dropdownvalue = 'Governorate';  
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
   // items.add('value');
    
  
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
      //     decoration: new BoxDecoration(
      //   gradient: new LinearGradient(
      //     colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
      //     begin: const FractionalOffset(0.5, 0.3),
      //     end: const FractionalOffset(0.6, 0),
      //     stops: [0.0, 0.8],
      //     tileMode: TileMode.clamp,
      //   ),
      // ),
          child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Column(
            children: [
              CalendarSelectionRange(),
              rentalInfo(),
   DropdownButton(
              
            // Initial Value
            value: dropdownvalue,
              style: new TextStyle(
        color: Color.fromARGB(209, 35, 61, 86),
        fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                         

      ),
      iconEnabledColor:Color.fromARGB(209, 35, 61, 86),
      
            // Down Arrow Icon
            icon: const Icon(Icons.arrow_drop_down_circle_outlined),    
              
            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) { 
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
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
                          sharedPrefs.saveLoc(dropdownvalue),
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
                  ///
                  
                  /////
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
                  
                  ),
                         
     
            
            ],
          ),
          
        ],
      )),
    );
  }
   Future<List<CompanyModel>> fetchAllCompany() async {
   items.clear();
   items.add('Governorate');
   
    var res= await http.get( Uri.parse(fetchData.baseURL+'/company'));
               var body = jsonDecode(res.body) as List;
   allcmp=List<CompanyModel>.from(body.map((i) => CompanyModel.fromJson(i)));
   for(int w=1;w<allcmp.length;w++){
    items.add(allcmp.elementAt(w).location_company.toUpperCase());
   }
   items = LinkedHashSet<String>.from(items).toList();
    return body.map((i) => CompanyModel.fromJson(i)).toList();
  
  }
}
