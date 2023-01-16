import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flycar/ProfilePages/page/profile_page.dart';
import 'package:flycar/common/theme_helper.dart';
import 'package:flycar/pages/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../api/fetchData.dart';
import '../konstants.dart';
import 'login_page.dart';


import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:async';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  final myController = TextEditingController();
final fn=TextEditingController();
final ln=TextEditingController();
 final pass=TextEditingController();
 final mail=TextEditingController();
final ph=TextEditingController();


  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

//////firstname	lastname	email	mobile_number	password/////
int w=0;
  Future register(String firstname, String lastname, String email,String mobile_number, String password) async {
 
try{
  //if(w==0){
      
      
      http.Response res = await http.get(
        //192.168.1.55 // 172.19.222.186
          Uri.parse(fetchData.baseURL+'/signup1?firstname='+firstname +
              '&&lastname='+lastname +'&&email=' +email +'&&mobile_number=' +mobile_number +
              '&&password=' +password),
          headers: {'Content-Type': 'application/json'});
 if (res.statusCode == 200) {
   
           Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false);
  //}
    }}
     catch (e) {
      print("no register");
    }
  }


//////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child:Container(
                 decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
        child: Column(
          children: [
            Container(
              
              height: 200,
                  // alignment: Alignment.bottomCenter
                child: Center(
                  child: Container(
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
            
            
                ),
                  Text(
                        'Creat Your Account',
                        style: TextStyle(color: Color.fromARGB(255, 203, 220, 229)),
                      ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.topCenter,
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                      
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'First Name', 'Enter your first name'),
                                   validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your First Name";
                              }
                              return null;
                            },
                                controller: fn,

                               style: TextStyle(
                            fontSize: 12,
                        //color: Color.fromARGB(255, 188, 182, 182),
                        fontFamily: 'halter',
                          package: 'flutter_credit_card',
                      
                            color: Color.fromRGBO(49, 81, 113, 1),
                            //fontSize: 60,
                            ),   
                                
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                'Last Name', 'Enter your last name'),
                           validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your Last Name";
                              }
                              return null;
                            },
                                controller: ln,
                                     style: TextStyle(
                            fontSize: 12,
                        //color: Color.fromARGB(255, 188, 182, 182),
                        fontFamily: 'halter',
                          package: 'flutter_credit_card',
                      
                            color: Color.fromRGBO(49, 81, 113, 1),
                            //fontSize: 60,
                            ), 
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if ((val!.isEmpty) || !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                            controller: mail,
                                 style: TextStyle(
                            fontSize: 12,
                        //color: Color.fromARGB(255, 188, 182, 182),
                        fontFamily: 'halter',
                          package: 'flutter_credit_card',
                      
                            color: Color.fromRGBO(49, 81, 113, 1),
                            //fontSize: 60,
                            ), 
                          ),
                          
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Mobile Number", "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if ((val!.isEmpty) || !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                            controller: ph,
                                 style: TextStyle(
                            fontSize: 12,
                        //color: Color.fromARGB(255, 188, 182, 182),
                        fontFamily: 'halter',
                          package: 'flutter_credit_card',
                      
                            color: Color.fromRGBO(49, 81, 113, 1),
                            //fontSize: 60,
                            ), 
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            controller:pass,
                                 style: TextStyle(
                            fontSize: 12,
                        //color: Color.fromARGB(255, 188, 182, 182),
                        fontFamily: 'halter',
                          package: 'flutter_credit_card',
                      
                            color: Color.fromRGBO(49, 81, 113, 1),
                            //fontSize: 60,
                            ), 
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 15.0),
                        // FormField<bool>(
                        //   builder: (state) {
                        //     return Column(
                        //       children: <Widget>[
                        //         Row(
                        //           children: <Widget>[
                        //             Checkbox(
                        //                 value: checkboxValue,
                        //                 onChanged: (value) {
                        //                   setState(() {
                        //                     checkboxValue = value!;
                        //                     state.didChange(value);
                        //                   });
                        //                 }),
                        //             Text(
                        //               "I accept all terms and conditions.",
                        //               style: TextStyle(color: Colors.grey),
                        //             ),
                        //           ],
                        //         ),
                        //         Container(
                        //           alignment: Alignment.centerLeft,
                        //           child: Text(
                        //             state.errorText ?? '',
                        //             textAlign: TextAlign.left,
                        //             style: TextStyle(
                        //               color: Theme.of(context).errorColor,
                        //               fontSize: 12,
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     );
                        //   },
                        //   validator: (value) {
                        //     if (!checkboxValue) {
                        //       return 'You need to accept terms and conditions';
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        // SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize:18,
                                  
                                  color: Colors.white,
                                  fontFamily: 'halter',
                          package: 'flutter_credit_card',
                                ),
                                
                              ),
                            ),
                            /**/ onPressed: () {
              
                               if (_formKey.currentState!.validate()) {
                              register(fn.text,ln.text,mail.text,ph.text,pass.text);
                            }},
                          ),
                        ),
                        SizedBox(height: 30.0),
                    
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),),
      ),
     
    );
    
  }
}
