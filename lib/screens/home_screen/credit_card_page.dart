import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flycar/ProfilePages/page/profile_page.dart';
import 'package:flycar/api/model/car_model.dart';
import 'package:flycar/api/model/company_model.dart';
import 'package:flycar/common/theme_helper.dart';
import 'package:flycar/konstants.dart';
import 'package:flycar/main.dart';
import 'package:flycar/pages/appbar.dart';
import 'package:flycar/pages/firstpage.dart';
import 'package:flycar/pages/splash_screen.dart';
import 'package:flycar/sharedPrefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:async';
import '/api/fetchData.dart';
class CreditCardPage extends StatefulWidget {
  final CarModel carModel;
  final CompanyModel companyModel;
  //const CreditCardPage({Key? key}) : super(key: key);
const CreditCardPage({required this.carModel,required this.companyModel});
  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}
late CarModel car;
late String emailSession;
late String userid;
late CompanyModel company;
//late double totalDays;
class _CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  String wallet = prefs.get("wallet").toString();
  String startd= prefs.get("startdate").toString();
  double totalDays=double.parse(prefs.get("total").toString());
   void initState() {
car=widget.carModel;
company=widget.companyModel;
 emailSession = prefs.get("tokemail").toString();
 //myWallet = double.parse(prefs.get("wallet").toString());
 userid=prefs.get("userID").toString();
 
   }
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
   double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
       appBar: AppBar(
        title: Text(
          "Credit Card",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color:Color.fromRGBO(49, 81, 113, 1),),
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardForm(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: onCreditCardModelChange,
                    themeColor: Colors.grey,
                    cursorColor:Color.fromRGBO(49, 81, 113, 1),
                    
                    /* Color _primaryColor = HexColor('#bed9f3');*/

                    formKey: formKey,
                    cardNumberDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'xxxx xxxx xxxx xxxx'),
                    expiryDateDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Expired Date',
                        hintText: 'xx/xx'),
                    cvvCodeDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CVV',
                        hintText: 'xxx'),
                    cardHolderDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder'
                          '                    ',
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: Color.fromRGBO(49, 81, 113, 1),
                     ),
                        
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      child: Text(
                        'Rent',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'halter',
                          fontSize: 14,
                          package: 'flutter_credit_card',
                        ),
                      ),
                    ),
                    onPressed: () async{
                      
                      if (formKey.currentState!.validate()) {
                        print('valid');
                        var res=await _CheckWallet();
                        if(res){
                        showDialogFunc(context, car.image, car.carname, "We Will Contact With You Before:"+startd,"Our Location: ${company.location_company}");
                        }
                        else {
                        showDialogNot(context,wallet,double.parse(car.price)*totalDays);
                        }
                      } else {
                        print('inValid');
                      }
                    },
                  )
                  ///////
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

   _CheckWallet() async {
//print(_value);
    print("insideList2");
    double myWallet=double.parse(wallet);
    double price=double.parse(car.price)*totalDays;
    if(myWallet>=price){
       double s=myWallet-price;
        //String wallet = prefs.get("wallet").toString();
      sharedPrefs.savewall(s.toString());
      print(" my wallet=$myWallet");
      print(" my price=$price");
      print(" my s=$s");
      print(" my wa=$wallet");

      datesDB(price.toString(),s.toString());
    }
    else
    //print(list1.where(((id) =>double.parse(id.price)<=_value)).toList());
    print(car.carname);
    return (myWallet>=price);
    //return car.where(((id) =>double.parse(id.price)<=_dvalue)).toList();
}
void datesDB(String price,String diff) async {
try{
 print("inside 1");
 String convertStartToString= prefs.get("startdate").toString();
    String convertEndToString= prefs.get("enddate").toString();
      http.Response res = await http.get(
        //192.168.1.55 // 172.19.222.186
          Uri.parse(fetchData.baseURL+'/carRentDateInsert?id='+car.id +'&&carid='+car.carid+'&&userID=' +userid+'&&startDate='+convertStartToString +
              '&&endDate='+convertEndToString+'&&price='+price+'&&wall='+diff),
          headers: {'Content-Type': 'application/json'});
           print("inside 2");
  //}
    } catch (e) {
      print("no register");
    }
  }

showDialogFunc(context, img, title, desc,loc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 370,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                    color:  Color.fromARGB(255, 26, 47, 99),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontFamily: 'halter',
                          package: 'flutter_credit_card',fontSize: 15, color:  Color.fromARGB(255, 26, 47, 99),),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  
                ),
                 SizedBox(
                      height: 10,
                    ),
                    Text(
                  loc,
                  style: TextStyle(
                    fontFamily: 'halter',
                          fontSize: 12,
                          package: 'flutter_credit_card',
                    color: Colors.grey[500],
                    
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child:  Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(
                                         fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                                          color: Colors.white),
                                    ),
                                  ),
                                onPressed:()async{
                                   Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) => first()),(Route<dynamic> route) => false);
                                  },
                                ),
                              ),),
                              
              //    ElevatedButton(
              //       // style: ElevatedButton.styleFrom(
              //       //     shape: RoundedRectangleBorder(
              //       //       borderRadius: BorderRadius.circular(8.0),
              //       //     ),
              //       //     primary: Color.fromARGB(255, 26, 47, 99)),
              //       child: Container(
              //        // margin: EdgeInsets.all(8.0),
              //         child: Text(
              //           'OK',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontFamily: 'halter',
              //             fontSize: 14,
              //             package: 'flutter_credit_card',
              //           ),
              //         ),
              //       ),
              //       onPressed: () async{
              //          Navigator.of(context).pushAndRemoveUntil(
              // MaterialPageRoute(builder: (context) => first()),
              // (Route<dynamic> route) => false);
              //       },
              //     )
              ],
              
            ),
          ),
        ),
        
      );
    },
  );
}

showDialogNot(context,w,tp) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 200,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 Text(
                  "The price in your Wallet="+w.toString(),
                  style: TextStyle(
                    
                    fontFamily: 'halter',
                          fontSize: 16,
                          package: 'flutter_credit_card',
                    color: Color.fromARGB(255, 26, 47, 99),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                 "Total price to rent this car for"+totalDays.toString()+" days="+tp.toString()+" ,You don't have enough money!",
                  style: TextStyle(
                    fontFamily: 'halter',
                          fontSize: 12,
                          package: 'flutter_credit_card',
                    color: Colors.grey,
                   
                  ),
                ),
         
                 SizedBox(
                      height: 10,
                    ),
                
                SizedBox(
                      width: MediaQuery.of(context).size.width / 1.6,
                      child:  Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(
                                         fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                                          color: Colors.white),
                                    ),
                                  ),
                                onPressed:()async{
                                   Navigator.of(context).pop();
                                  },
                                ),
                              ),),
                              
              //    ElevatedButton(
              //       // style: ElevatedButton.styleFrom(
              //       //     shape: RoundedRectangleBorder(
              //       //       borderRadius: BorderRadius.circular(8.0),
              //       //     ),
              //       //     primary: Color.fromARGB(255, 26, 47, 99)),
              //       child: Container(
              //        // margin: EdgeInsets.all(8.0),
              //         child: Text(
              //           'OK',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontFamily: 'halter',
              //             fontSize: 14,
              //             package: 'flutter_credit_card',
              //           ),
              //         ),
              //       ),
              //       onPressed: () async{
              //          Navigator.of(context).pushAndRemoveUntil(
              // MaterialPageRoute(builder: (context) => first()),
              // (Route<dynamic> route) => false);
              //       },
              //     )
              ],
              
            ),
          ),
        ),
        
      );
    },
  );
}

}
