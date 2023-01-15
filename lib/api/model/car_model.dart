import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:async';

class CarModel {
  late String carname, price, image, year, speed, fule, seats,carid,id;

  CarModel(
    this.carname,
    this.price,
    this.image,
    this.year,
    this.fule,
    this.seats,
    this.speed,
    this.carid,
    this.id,
  );

  CarModel.fromJson(Map<String, dynamic> map) {
    this.carname = map['carname'];
    this.price = map['price'];
    this.image=map['carimg'];
    //var blob = yourJSONMapHere['yourJSONKeyHere'];
    //this.image = 'assets/images/lambo aventador.png';
    this.year = map['caryear'];
    this.fule = map['fule'];
    this.seats = map['seats'];
    this.speed = map['speed'];
    this.id = map['id'].toString();
    this.carid= map['carid'];

    // this.image=map['carimg'].toString('base64');
    // this.year=map['caryear'];
    // this.fule=map['fule'];
    //  this.seats=map['seats'];
    //  this.speed=map['speed'];
  }
}



//  List<CarModel> carmodel = [
//   CarModel(
//     title: 'Lamborghini',
//     subtitle: 'Automobile',
//     price: '\$300/day',
//     image: 'assets/images/lambo aventador.png',
//     year: '2020',
//     text1: '450km',
//     text2: 'Manual',
//     text3: 'Diesel',
//     text4: '4 seats',
//   ),
//   CarModel(
//     title: 'BMW L8',
//     subtitle: 'Automobile',
//     price: '\$250/day',
//     image: 'assets/images/bmw1.png',
//     year: '2019',
//     text1: '350km',
//     text2: 'Automatic',
//     text3: 'Petrol',
//     text4: '4 seats',
//   ),
//   CarModel(
//     title: 'Lexus 470',
//     subtitle: 'Automobile',
//     price: '\$250/day',
//     image: 'assets/images/lexus2.png',
//     year: '2020',
//     text1: '350km',
//     text2: 'Automatic',
//     text3: 'Petrol',
//     text4: '6 seats',
//   ),
// ];
////
// class userModel {
//   late String Identity;
//   late String name;
//   late String phone;
//   late String password;
//   late String id;

//   userModel(this.Identity, this.name, this.phone, this.id);

//   userModel.fromJson(Map<String, dynamic> map) {
//     this.Identity = map['Identity'];
//     this.name = map['name'];
//     this.phone = map['phone'];
//     this.id = map['_id'];
//     this.password = map['password'];
//   }
// }
// cardb() async{
// http.Response res = await http.get(
//           Uri.parse('http://172.19.168.198:8000/car'),
//           headers: {'Content-Type': 'application/json'});

// if(res.statusCode==200){
//              var jsonStr=json.decode(res.body) ;
//               carmodel=[
//                CarModel(
//                 title: jsonStr['carname'],
//     subtitle: jsonStr['speed'],
//     price: '\$300/day',
//     image: 'assets/images/lambo aventador.png',
//     year: '2020',
//     text1: '450km',
//     text2: 'Manual',
//     text3: 'Diesel',
//     text4: '4 seats',
  
//   ),
//              ];
            
// }
//  else {
//           throw Exception("faild to load");
//         }
// }