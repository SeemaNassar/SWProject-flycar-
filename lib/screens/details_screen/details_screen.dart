import 'package:flycar/api/model/company_model.dart';
import 'package:flycar/konstants.dart';
import "package:flycar/api/model/car_model.dart";
import 'package:flycar/size_config.dart';
import 'package:flutter/material.dart';

import 'bottom.dart';

class DetailsScreen extends StatefulWidget {
  final CarModel carModel;
   final CompanyModel companyModel;
  const DetailsScreen({required this.carModel,required this.companyModel});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: kCyanColor,
        ),
        backgroundColor: kBgColor,
        elevation: 0,
        title: Text("${widget.companyModel.user_type} Company",style: TextStyle(fontSize: 20, height: 1.5,fontFamily: 'halter',
                          color:Color.fromRGBO(49, 81, 113, 1),
                          package: 'flutter_credit_card',),),
        
      ),
      
      backgroundColor: kBgColor,
      body: SafeArea(
        bottom: false,
        child: DetailsBody(
          carModel: widget.carModel, companyModel:widget.companyModel,
        ),
      ),
    );
  }
}

class DetailsBody extends StatefulWidget {
  final CarModel carModel;
  final CompanyModel companyModel;
  const DetailsBody({required this.carModel,required this.companyModel});

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateWidth(20),
                vertical: getProportionateHeight(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.carModel.carname,
                  style: TextStyle(fontSize: 25,fontFamily: 'halter',
                          color:Color.fromRGBO(49, 81, 113, 1),
                          package: 'flutter_credit_card',),
                ),
               
                Text(
                  widget.carModel.year,
                  style: TextStyle(fontSize: 18, height: 1.5,fontFamily: 'halter',
                          color:Color.fromRGBO(49, 81, 113, 1),
                          package: 'flutter_credit_card',),
                )
              ],
              
            ),
            
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Image.asset(
              widget.carModel.image,
              width: getProportionateWidth(350),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateWidth(20),
                vertical: getProportionateHeight(20)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: kCyanColor),
            child: Bottom(
              carModel: widget.carModel,companyModel:widget.companyModel,
            ),
          ),
        )
      ],
    );
  }
}
