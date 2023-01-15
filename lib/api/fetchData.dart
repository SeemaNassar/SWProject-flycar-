import 'dart:convert';
import 'package:flycar/api/model/taxi_model.dart';
import "package:flycar/api/model/user_model.dart";
import 'package:http/http.dart' as http;
import 'package:flycar/sharedPrefs.dart';
import '../main.dart';
import 'model/car_model.dart';


class fetchData {
  static const String baseURL = "http://192.168.1.58:8000";
  String emailSession = prefs.get("tokemail").toString();

  Future<userModel> FetchMyAccount() async {
    emailSession = prefs.get("tokemail").toString();
    var res = await http.get(
        Uri.parse(fetchData.baseURL + '/profile1?email=' + emailSession),
        headers: {'Content-Type': 'application/json'});
    var body = jsonDecode(res.body) as List<dynamic>;

    userModel myData = userModel.fromJson(body[0]);
    return myData;
  }
    Future<List<CarModel>> fetchAllCars() async {
    var res = await http.get(Uri.parse(fetchData.baseURL + "/car"));
    var body = jsonDecode(res.body) as List;
    DateTime s=DateTime.now();
    print(s.toString());
    return body.map((car) => CarModel.fromJson(car)).toList();
  }

  Future<List<TaxiModel>> FetchTaxis() async {
    var res = await http.get(Uri.parse(fetchData.baseURL + "/taxi"));
    var body = jsonDecode(res.body) as List;
    return body.map((taxi) => TaxiModel.fromJson(taxi)).toList();
  }
}
