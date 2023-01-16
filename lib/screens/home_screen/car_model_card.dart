
import "package:flycar/api/model/car_model.dart";
import 'package:flycar/api/model/company_model.dart';
import 'package:flycar/screens/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import '../../konstants.dart';
import '../../size_config.dart';
import 'dart:convert';
import 'dart:typed_data';
class CarModelCard extends StatefulWidget {
  final CarModel carModel;
final List<CompanyModel> companyModel;
  const CarModelCard({required this.carModel,required this.companyModel});

  @override
  State<CarModelCard> createState() => _CarModelCardState();
}late List<CompanyModel> fcmp;
late CompanyModel myCmp;
class _CarModelCardState extends State<CarModelCard> {
  @override
  void initState() {
   fcmp=[];
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
 

 fcmp=_runFilterCMP();
 myCmp=fcmp.elementAt(0);
 
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, primaryAnimation, secondaryAnimation) =>
                DetailsScreen(carModel: widget.carModel,companyModel:_runFilterCMP()[0]),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: getProportionateWidth(10),
          vertical: getProportionateHeight(10),
        ),
        width: double.infinity,
        height: SizeConfig.screenHeight! * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 5,
              color: kCyanColor.withOpacity(0.5),
            ),
            BoxShadow(
              offset: Offset(-5, -5),
              blurRadius: 5,
              color: kCyanColor.withOpacity(0.1),
            ),
          ],
        ),
        
        child: Stack(children: [
          Container(
            width: SizeConfig.screenWidth! * 0.9,
            margin: EdgeInsets.only(right: getProportionateWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateWidth(15),
              vertical: getProportionateHeight(10),
            ),
            decoration: BoxDecoration(
              color: kBgColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.carModel.carname,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'halter',
                          
                          package: 'flutter_credit_card',color:Color.fromRGBO(49, 81, 113, 1),),
                ),
                Text(
                  myCmp.user_type,
                  style: TextStyle(height: 1.5,fontFamily: 'halter',
                         fontSize: 14,
                          package: 'flutter_credit_card',color:Color.fromRGBO(49, 81, 113, 1),),
                ),
                SizedBox(
                  height: getProportionateHeight(30),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateWidth(20),
                  vertical: getProportionateHeight(2)),
              width: getProportionateWidth(200),
              height: getProportionateHeight(20),
              child: Text(
                '${widget.carModel.price} ₪',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,fontFamily: 'halter',
                          package: 'flutter_credit_card',color:Color.fromRGBO(49, 81, 113, 1),),
              ),
              decoration: BoxDecoration(
                  color: kDecorationColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
            ),
          ),
          
          Positioned(
            right: 0,
            bottom: 10,
            child:
            //Image.memory(image,
            // height: getProportionateHeight(100),
            // ),
            //Image.memory(imageData,height: getProportionateHeight(100),),
             Image.asset(
              //var image = BASE64.decode(carModel.image);
              widget.carModel.image,
              //carModel.image,
              height: getProportionateHeight(100),
            ),
          )
        ]),
      ),
    );
  }

    _runFilterCMP() {
    return widget.companyModel.where((name) => name.id.contains((widget.carModel.id))).toList();
}
}
