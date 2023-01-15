///newwwww
import 'package:flutter/material.dart';
import 'package:flycar/ProfilePages/page/edit_profile_page.dart';
import 'package:flycar/ProfilePages/widget/profile_widget.dart';
import 'package:flycar/Taxi/send_feedback.dart';
import 'package:flycar/api/fetchData.dart';
import 'package:flycar/api/model/user_model.dart';
import 'package:flycar/pages/appbar.dart';
import 'package:flycar/pages/firstpage.dart';
import 'package:flycar/pages/splash_screen.dart';
import 'package:flycar/sharedPrefs.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:async';
import '../../konstants.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
// ignore: non_constant_identifier_names

class _ProfilePageState extends State<ProfilePage> {
  
  double _drawerIconSize = 24;
late userModel data;
late userModel d;
  double _drawerFontSize = 17;

  fetchData _fetchData = fetchData();
  @override
  void initState() {
     _fetchData.FetchMyAccount();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    backgroundColor: kBgColor;
    return 
        Scaffold(
           backgroundColor: kBgColor,
          appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
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
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
       
              SizedBox(
                height: 30,
              ),
          
              ProfileWidget(
                imagePath:'https://static.vecteezy.com/system/resources/thumbnails/000/367/333/small/Universal__28138_29.jpg',
                onClicked: () {
                 
                  print(data);
                   Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage(usermodel:data)),
                  );
                  
                },
              ),
              
myData(),
             
            ],
          ),
        );
      
  }

      //////////////
      Widget myData() {
    return FutureBuilder(
        future: _fetchData.FetchMyAccount(),
        builder: ((context, snapshot) {
          if(snapshot.data!=null){
           data = snapshot.data as userModel;

          print(data);
          }
          return snapshot.data == null
              ? Text("Loading..")
              : Stack(
                  children: [
                 
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            data.firstname + " " + data.lastname,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'halter',
                          package: 'flutter_credit_card',color: Theme.of(context).accentColor),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 4.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "Information",
                                    style: TextStyle(
                                      
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                     color: Theme.of(context).accentColor,fontFamily: 'halter',
                          package: 'flutter_credit_card',
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                //Icon(Icons.edit,size: 20,),

                                Card(
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            ...ListTile.divideTiles(
                                              color:Theme.of(context).accentColor,
                                              tiles: [
                                                ListTile(
                                                 
                                                  leading: Icon(Icons.abc),
                                                  textColor:Theme.of(context).accentColor,
                                                  title: Text("First Name"),

                                                  subtitle:
                                                      Text(data.firstname),
                                                ),
                                                ListTile(
                                                  textColor:Theme.of(context).accentColor,
                                                  leading: Icon(Icons.abc),
                                                  title: Text("Last Name"),
                                                  subtitle: Text(data.lastname),
                                                ),
                                                ListTile(
                                                  textColor:Theme.of(context).accentColor,
                                                  leading: Icon(Icons.email),
                                                  title: Text("Email"),
                                                  subtitle: Text(data.email),
                                                ),
                                                ListTile(
                                                  textColor:Theme.of(context).accentColor,
                                                  leading: Icon(Icons.phone),
                                                  title: Text("Phone"),
                                                  subtitle: Text(
                                                      data.Mobile_number
                                                          .toString()),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
        }));
  }
}
