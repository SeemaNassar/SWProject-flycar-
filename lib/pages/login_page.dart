import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flycar/common/theme_helper.dart';
import 'package:flycar/pages/firstpage.dart';
import '../konstants.dart';
import 'registration_page.dart';
import 'widgets/header_widget.dart';
import 'package:flycar/sharedPrefs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../api/fetchData.dart';

//var sessionManager=SessionManager();
late String f = "";
late String l = "";
late String p = "";
late String e = "";
late String m = "";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();
  final mail = TextEditingController();
  final pass = TextEditingController();
  Future logindb(String email, String password) async {
    try {
// print(email);
// print(password);
//await sessionManager.set('emailSession', "");
      http.Response res = await http.get(
          Uri.parse(fetchData.baseURL +
              '/login1?email=' +
              email +
              '&&password=' +
              password),
          headers: {'Content-Type': 'application/json'});
      print(res.body);

      if (res.statusCode == 200) {
        var jsonStr = json.decode(res.body) as List;
        e = jsonStr.elementAt(0)['email'];
        if (e == email) {
          //var jsonStr=json.decode(res.body) as List;
          //if(jsonStr.elementAt(0)['email']==email){
          print("saaveee the emailllll");
          sharedPrefs.saveEmail(email,jsonStr.elementAt(0)['userID'].toString());
          sharedPrefs.savewall(jsonStr.elementAt(0)['wallet']);
          //await sessionManager.set('emailSession', email);
          // }
          //ProfilePage.fill(jsonStr);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => first()),
              (Route<dynamic> route) => false);
        }
        // TODO: Create login function

        // print(p);
        // TODO: Create login function

      } else
        Fluttertoast.showToast(
            msg: 'Email and password not valid?', textColor: Colors.red);
    } catch (e) {
      print("error");
    }
  }
  /////////
   Future driverdb(String email, String password) async {
    try {
// print(email);
// print(password);
//await sessionManager.set('emailSession', "");
      http.Response res = await http.get(
          Uri.parse(fetchData.baseURL +
              '/driver1?email=' +
              email +
              '&&password=' +
              password),
          headers: {'Content-Type': 'application/json'});
      print(res.body);

      if (res.statusCode == 200) {
        var jsonStr = json.decode(res.body) as List;
        e = jsonStr.elementAt(0)['email'];
        if (e == email) {
          //var jsonStr=json.decode(res.body) as List;
          //if(jsonStr.elementAt(0)['email']==email){
         // print("saaveee the emailllll");
          //sharedPrefs.saveEmail(email,jsonStr.elementAt(0)['userID'].toString(),jsonStr.elementAt(0)['wallet']);
          //await sessionManager.set('emailSession', email);
          // }
          //ProfilePage.fill(jsonStr);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => first()),
              (Route<dynamic> route) => false);
        }
        // TODO: Create login function

        // print(p);
        // TODO: Create login function

      } else
        Fluttertoast.showToast(
            msg: 'Email and password not valid?', textColor: Colors.red);
    } catch (e) {
      print("error");
    }
  }
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: kBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: _headerHeight,
            //   child: 
            //   HeaderWidget(_headerHeight, true,
            //       Icons.person_rounded), //let's create a common header widget
            // ),
            Container(
              height: 350,
                  // alignment: Alignment.bottomCenter
                      decoration: BoxDecoration(

             // shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/company.png'),
                opacity:1.0,
                //scale:0.5,
              ),
            ),
                ),
                
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 10, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        'Rent & Order Car',
                        style: TextStyle(
                            fontSize: 20,
                        //color: Color.fromARGB(255, 188, 182, 182),
                        fontFamily: 'halter',
                          package: 'flutter_credit_card',
                        fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(49, 81, 113, 1),
                            //fontSize: 60,
                            ),
                      ),
                      Text(
                        'Login into your account',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      "E-mail address", "Enter your email"),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) {
                                    if ((val!.isEmpty) ||
                                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                            .hasMatch(val)) {
                                      return "Enter a valid email address";
                                    }
                                    return null;
                                  },
                                  controller: mail,
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
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
                                  controller: pass,
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              // Container(
                              //   margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                              //   alignment: Alignment.center,
                              //   child: GestureDetector(
                              //     onTap: () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 ForgotPasswordPage()),
                              //       );
                              //     },
                              //     child: Text(
                              //       "Forgot your password?",
                              //       style: TextStyle(
                              //         color: Colors.grey,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,fontFamily: 'halter',
                          package: 'flutter_credit_card',
                        ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      logindb(mail.text, pass.text);
                                    }
                                    //After successful login we will redirect to profile page. Let's create profile page now
                                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => first()));
                                  },
                                ),
                              ),
                              //  SizedBox(height: 15.0),
                              //      Container(
                              //   decoration:
                              //       ThemeHelper().buttonBoxDecoration(context),
                              //   child: ElevatedButton(
                              //     style: ThemeHelper().buttonStyle(),
                              //     child: Padding(
                              //       padding:
                              //           EdgeInsets.fromLTRB(40, 10, 40, 10),
                              //       child: Text(
                              //         'Driver'.toUpperCase(),
                              //         style: TextStyle(
                              //             fontSize: 20,
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.white),
                              //       ),
                              //     ),
                              //     onPressed: () {
                              //       if (_formKey.currentState!.validate()) {
                              //         driverdb(mail.text, pass.text);
                              //       }
                              //       //After successful login we will redirect to profile page. Let's create profile page now
                              //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => first()));
                              //     },
                              //   ),
                              // ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Don\'t have an account? ",   style: TextStyle(
                                       fontSize: 13,
                                        color: Colors.blueGrey
                                        ,fontFamily: 'halter',
                          package: 'flutter_credit_card',
                        ),),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor
                                        ,fontFamily: 'halter',
                          package: 'flutter_credit_card',
                        ),
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
