
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flycar/api/fetchData.dart';
import 'package:flycar/api/model/taxi_model.dart';
import 'package:flycar/common/theme_helper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../konstants.dart';
import 'package:geolocator/geolocator.dart';


class addBasket extends StatefulWidget {
  const addBasket({Key? key}) : super(key: key);
  @override
  _addBasket createState() => _addBasket();
}

class _addBasket extends State<addBasket> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyMap(),
    );
  }
}

class MyMap extends StatefulWidget {
  @override
  _MyMap createState() => new _MyMap();
}

class _MyMap extends State<MyMap> {
  bool isChecked = false;
  //fetchData _fetchData = fetchData();
  // TextEditingController _lat = TextEditingController(); //x
  // TextEditingController _long = TextEditingController(); //y
double _latPoint=32.22528;
double _longPoint=35.25972;

  @override
  void initState() {
    distance=[];
    pos();
    super.initState();
    fetchAllPoints();
   
      /// connect with database and get all positions 
  }

pos() async{
//     await Geolocator.openAppSettings();
// await Geolocator.openLocationSettings();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
print(position.latitude);
print(position.longitude);
}
  @override
  List<TaxiModel> _points = []; //x and y points
  List<TaxiModel> _diff = []; 
   List<TaxiModel> _3KNN = [];
  // final String _phone ='+09987777';
  late List<double> distance;
  late String _call;
  late String _text;
  Widget build(BuildContext context) {
    
    return new Scaffold(
      backgroundColor: kBgColor,
        
        body: FlutterMap(
          options: new MapOptions(
            center: new LatLng(_latPoint, _longPoint),// my location 
            minZoom: 7.0,
            zoom: 12,
            
          ),
          
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions( // taxis
              markers: _points
                  .map((e) => Marker(
                        width: 45.0,
                        height: 45.0,
                        point:
                            LatLng(double.parse(e.lat), double.parse(e.long)), //no change
                        builder: (context) => Container(
                          child: IconButton(
                              icon: Icon(Icons.local_taxi),
                              color: Color.fromARGB(255, 26, 47, 99), // my icon
                              onPressed: () { 
                                //my notification

                                addMarker(e.user,e.phone);
                                print('Marker tapped!');
                              }),
                        ),
                      ))
                  .toList(),
            ),
                 MarkerLayerOptions( // taxis
              markers: _diff.getRange(1, 3)
                  .map((e) => Marker(
                        width: 45.0,
                        height: 45.0,
                        point:
                            LatLng(double.parse(e.lat), double.parse(e.long)), //no change
                        builder: (context) => Container(
                          child: IconButton(
                              icon: Icon(Icons.local_taxi), 
                               color: Color.fromARGB(255, 229, 128, 46),// my icon
                              onPressed: () { 
                                //my notification
                                addMarker(e.user,e.phone);
                                print('near to you');
                              }),
                        ),
                      ))
                  .toList(),
            ),
            MarkerLayerOptions( // taxis
              markers: _diff.getRange(0,1)
                  .map((e) => Marker(
                        width: 45.0,
                        height: 45.0,
                        point:
                            LatLng(double.parse(e.lat), double.parse(e.long)), //no change
                        builder: (context) => Container(
                          child: IconButton(
                              icon: Icon(Icons.local_taxi), 
                               color: Colors.red,// my icon
                              onPressed: () { 
                              addMarker(e.user,e.phone);
                                //Calculate_KNN();
                                print('near to you');
                              }),
                        ),
                      ))
                  .toList(),
            ),
            MarkerLayerOptions( // taxis
              markers: [
                Marker(point: LatLng(_latPoint, _longPoint), 
                   builder: (context) => Container(
                          child: IconButton(
                              icon: Icon(Icons.location_pin),
                              color: Color.fromARGB(255, 26, 47, 99), // my icon
                              onPressed: () { 
                                //addMarker();
                                print('My location');
                              }),
                        ),
                )
              ]
            ),
            
          ],
        ));
  }

  void fetchAllPoints() async {
    var data = await FetchTaxis();
    setState(() {
      this._points = data;
      this._diff= data;
    });
     Calculate_KNN();
  }

  Future addMarker(String name,String phone) async { // pop //up
    await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(
              '$name \n $phone',
              style: TextStyle(
                fontFamily: 'halter',
                          fontSize: 15,
                          package: 'flutter_credit_card',
                color: Color.fromARGB(255, 26, 47, 99),
                
              ),
              textAlign: TextAlign.center,
            ),
            
            actions: <Widget>[
              Center(
                child: Column(
                  children: [
    
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
                                      'Call',
                                      style: TextStyle(
                                         fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                                          color: Colors.white),
                                    ),
                                  ),
                                onPressed:()async{
                                   _call ='tel:$phone';
                                   if ( await canLaunch (_call) ){
                                     await launch(_call);
                                     }},
                                ),
                              ),),
                               SizedBox(
                      height: 20,
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
                                      'Message',
                                      style: TextStyle(
                                         fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                                          color: Colors.white),
                                    ),
                                  ),
                                 onPressed:()async{
                                   _text ='sms:$phone';
                                   if ( await canLaunch (_text) ){
                                     await launch(_text);
                                     }},
                                ),
                              ),
                              
  //                     child: ElevatedButton(
  //                         onPressed: () {
  //                           _addBasket();
  //                           setState(() {});
  //                         },
  //                       style: ElevatedButton.styleFrom(
  //   primary:  Colors.white,
  //   onPrimary:  Colors.white,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(32.0),
  //   ),
  // ),
  //                         child: Container(
  //                             width: MediaQuery.of(context).size.width,
  //                             height: 50,
  //                             decoration: BoxDecoration(
  //                                 gradient: LinearGradient(
  //                                   begin: Alignment.centerRight,
  //                                   end: Alignment.centerLeft,
  //                                   colors: [
  //                                    Colors.white,
  //                                     Color.fromARGB(255, 56, 81, 135),
  //                                   ],
  //                                 ),
  //                                 borderRadius:
  //                                     BorderRadius.all(Radius.circular(30))),
  //                             child: Center(
  //                               child: Text(
  //                                 'Cancel',
  //                                 style: TextStyle(
  //                                   fontFamily: 'halter',
  //                                   package: 'flutter_credit_card',
  //                                   fontSize: 18,
  //                                   color: Colors.white,
  //                                 ),
  //                               ),
  //                             ))),
                    ),
                     SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
   Future<List<TaxiModel>> FetchTaxis() async {
    var res = await http.get(Uri.parse(fetchData.baseURL + "/taxi"));
    var body = jsonDecode(res.body) as List;
    
    return body.map((taxi) => TaxiModel.fromJson(taxi)).toList();
  }

  Future<List<TaxiModel>> Calculate_KNN() async{
    distance.clear();
    double min=0;
    TaxiModel minSort;
  
    for(int i=0;i<_points.length;i++){
distance.add(calculateDistance(_latPoint, _longPoint,
 double.parse(_points.elementAt(i).lat), double.parse(_points.elementAt(i).long)));
    }
    
 print("hi before");
 print(_points.elementAt(0).lat);
    for(int i=0;i<_diff.length;i++){

      for(int j=i+1;j<_points.length;j++){
  if(distance[i]>distance[j]){
      min=distance[i];
      distance[i]=distance[j];
      distance[j]=min;
     minSort=_diff[i];
     _diff[i]=_diff[j];
     _diff[j]=minSort;
     }
      }
   
    }
    print("hi after");
 print(_diff.elementAt(0).lat);
    print(distance);
    
 return _diff;
  }
  double calculateDistance( lat1, lon1,lat2, lon2){
  var p = 0.017453292519943295;
  var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
        cos(lat1 * p) * cos(lat2 * p) * 
        (1 - cos((lon2 - lon1) * p))/2;
  return 12742 * asin(sqrt(a));
}
  // Future<void> _addBasket() async { // delete (aleart)
  //   if (_lat.text.isEmpty || _long.text.isEmpty ) {
  //     AwesomeDialog(
  //       context: context,
  //       dialogType: DialogType.ERROR,
  //       animType: AnimType.RIGHSLIDE,
  //       headerAnimationLoop: true,
  //       title: 'الإدخال خاطئ',
  //       desc: 'يوجد حقل فارغ',
  //       btnOkOnPress: () {},
  //       btnOkIcon: Icons.cancel,
  //       btnOkColor: Color.fromARGB(255, 196, 27, 15),
  //     ).show();
  //     return;
  //   }

  //   var body = jsonEncode({
  //     "lat": _lat.text,
  //     "long": _long.text,
  //     "sizePoint": _size.text,
  //   });
  //   var res = await http.post(Uri.parse(baseUrl + "/maps"),
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: body);
  //   AwesomeDialog(
  //     context: context,
  //     animType: AnimType.LEFTSLIDE,
  //     headerAnimationLoop: false,
  //     dialogType: DialogType.SUCCES,
  //     showCloseIcon: true,
  //     title: 'نجحت العملية',
  //     desc: 'تم إضافة حاوية جديدة',
  //     btnOkOnPress: () {
  //       debugPrint('OnClcik');
  //     },
  //     btnOkIcon: Icons.check_circle,
  //     onDissmissCallback: (type) {
  //       debugPrint('Dialog Dissmiss from callback $type');
  //     },
  //   ).show();
  // }
 

  // void clear() {
  //   _lat.text = "";
  //   _long.text = "";
  // }
}
