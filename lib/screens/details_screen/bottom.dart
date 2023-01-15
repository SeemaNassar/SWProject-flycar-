import "package:flycar/api/model/car_model.dart";
import 'package:flycar/api/model/company_model.dart';
import 'package:flycar/screens/home_screen/credit_card_page.dart';
import 'package:flycar/widgets/default_buton.dart';
import 'package:flutter/material.dart';
import 'package:flycar/celender.dart';
import '../../konstants.dart';
import '../../size_config.dart';
import 'package:flycar/common/theme_helper.dart';
import 'package:example/main_rent_Cale.dart';

class Bottom extends StatelessWidget {
  final CarModel carModel;
 final CompanyModel companyModel;
  const Bottom({required this.carModel,required this.companyModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'OverView',
              style: TextStyle(
                  color: kBgColor, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'halter',
                        
                          package: 'flutter_credit_card',),
            ),
            Text(
              '${carModel.price} ₪',
              style: TextStyle(
                  color: kBgColor, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'halter',
                     
                          package: 'flutter_credit_card',),
            )
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          
          overview(carModel.speed, Icons.speed),
          overview(carModel.fule,Icons.warning,)
       
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          overview(companyModel.location_company, Icons.location_on_rounded),
          overview(carModel.seats, Icons.chair),
        ]),
        //

        // Container(
        //   height: 60,
        //   width: double.infinity,
        //   decoration: ThemeHelper().buttonBoxDecoration(context),
        //   child: ElevatedButton(
        //     style: ThemeHelper().buttonStyle(),
        //     //minWidth: double.infinity,
        //     //height: 60,

        //     onPressed: () {
        //       Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => CreditCardPage(carModel: carModel,)));
        //     },
        //     // defining the shape
        //     // shape: RoundedRectangleBorder(
        //     //     side: BorderSide(color: Colors.black),
        //     //     borderRadius: BorderRadius.circular(50)),
        //     child: Padding(
        //       padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        //       child: Text(
        //         "Rent",
        //         style: TextStyle(
        //             fontWeight: FontWeight.w600,
        //             fontSize: 18,
        //             color: Colors.white),
        //       ),
        //     ),
        //   ),
        // ),

        
        
        MaterialButton(
          minWidth: double.infinity,
          height: 60,

           onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreditCardPage(carModel: carModel,companyModel:companyModel)));
            },
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
                      "Rent",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18,color: Color.fromARGB(255, 35, 62, 74),fontFamily: 'halter',
                      
                          package: 'flutter_credit_card',),
                    ),
        )
      ],
    );
  }

  Container overview(String text, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateHeight(10)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateWidth(10), vertical: 10),
      width: SizeConfig.screenWidth! * 0.4,
      height: SizeConfig.screenHeight! * 0.08,
      decoration: BoxDecoration(
          // color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kPrimaryColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: getProportionateWidth(30),
            height: getProportionateHeight(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: kBgColor),
            child: Icon(
              icon,
              color: kCyanColor,
            ),
          ),
          Text(
            text,
            style: TextStyle(color: kBgColor, fontSize: 18),
          )
        ],
      ),
    );
  }
}
