import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:async';

class TaxiModel {
  late String lat, long, id, user, phone;

  TaxiModel(
    this.lat,
    this.long,
    this.id,
    this.user,
    this.phone,
  );

  TaxiModel.fromJson(Map<String, dynamic> map) {
    this.lat = map['lat'];
    this.long= map['long'];
    this.id = map['taxi_id'].toString();
    this.user= map['driver_name'];
    this.phone= map['phone'];
    
  }
}


