import 'dart:convert';
//import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:flycar/api/model/car_model.dart';
import 'package:flycar/common/theme_helper.dart';
import 'package:flycar/konstants.dart';
import 'package:flycar/screens/home_screen/custom_navbar.dart';
import 'package:flycar/size_config.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '/api/fetchData.dart';
import 'package:http/http.dart' as http;
import 'homebody.dart';

late final List<String> company;
late final List<String> companyname;
late final List<String> companyname2;
late final List<String> type;
late List<CarModel> list1;
late List<CarModel> list2;
late List<CarModel> ResetList;
int f=0;
int stop=0;
double _value = 50.0;
double _dvalue = _value*6.0;
class multselect extends StatefulWidget {
  final List<String> items;
  // final List<String> items2;

  const multselect({Key? key, required this.items}) : super(key: key);

  @override
  State<multselect> createState() => _multselectState();
}

// void main() {
//   runApp(MaterialApp(
//       title: 'filter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: r()));
// }

/////
class _multselectState extends State<multselect> {
  final List<String> _selectedItem = [];

  void _itemchenge(String itemvalue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItem.add(itemvalue);
      } else {
        _selectedItem.remove(itemvalue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() async{
    Navigator.pop(context, _selectedItem);
   // Navigator.pop(context, await _runFilter2(_selectedItem));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
         titleTextStyle: TextStyle(
                                          fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                                         color: Color.fromRGBO(49, 81, 113, 1)),
                                         
      title: const Text('select'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItem.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemchenge(item, isChecked!),
                  ))
              .toList(),
        ),
        
      ),
      contentTextStyle:TextStyle(fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                     color: Color.fromRGBO(49, 81, 113, 1)),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cansel'),
          
        ),
        ElevatedButton(
            onPressed: _submit,
            child: const Text(
              ('selesct'),
            )),
      ],
    );
  }
}

////////////////////

class filter extends StatefulWidget {
final List<CarModel> carModel;

   const filter({required this.carModel});


    @override
  _filterState createState() => _filterState();
}

class _filterState extends State<filter> {
  // String filterText = "";

  List<String> _selectedItems = [];

    void fetchAllCars() async {
    company.clear();
    type.clear();
   for(int i=0;i<ResetList.length;i++){
    print("hi from for");
    print(i);
    company.add(ResetList.elementAt(i).id);
    if(!type.contains(ResetList.elementAt(i).carname)){
    type.add(ResetList.elementAt(i).carname);
   }}
   
  
  }
 
//   Future<List<String>> fetchcompanyName() async {
     
// for(int j=0;j<list1.length;j++){
//       var res= await http.get( Uri.parse(fetchData.baseURL+'/company?id='+ list1.elementAt(j).id));      
//     var body = jsonDecode(res.body) as List;
//     listDB.add(body.elementAt(j)['user_type']);
//    }
//     //print(body);
  
//     print('insidefetch');
    
//     return listDB;
//   }

 
  Future<List<String>> fetchcompanyName() async {
companyname.clear();
companyname2.clear();
int q=0;
      var res= await http.get( Uri.parse(fetchData.baseURL+'/company'));      
    var body = jsonDecode(res.body) as List;
    //listDB.add(body.elementAt()['user_type']);
    for(int w=0;w<body.length;w++){
     q=0;
      print("out"+body.elementAt(w)['id'].toString());
for(int j=0;j<company.length;j++){
  
  print('inside'+company.elementAt(j));
  //print(body.elementAt(w)['id'].toString()==company.elementAt(j));
  if(body.elementAt(w)['id'].toString()==company.elementAt(j)){ 
    print("if");
    if(q!=company.length){
   companyname.add(body.elementAt(w)['user_type']);
   print(j);
   print(companyname);
   q=company.length;
   }
   
    companyname2.add(body.elementAt(w)['user_type']);
   
   } 
   print(companyname);
    //print(body);
} 
 }
    print('insidefetch');
    
    return companyname;
  }

  void initState() {
    if(f==0){
      ResetList=widget.carModel;
       list2=[];
        company=[];
      type=[];
      companyname=[];
      companyname2=[];
    list1=widget.carModel;
    ResetList=widget.carModel;
    
    }
    f++;
    //print(list1.elementAt(1).carname);
    fetchAllCars();
    super.initState();
    // TODO: implement initState
    
    
  }

  void _mylist() async {
    final List<String> items = await fetchcompanyName();
  
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return multselect(items: items);
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
     var w= await _runFilter(_selectedItems);
      Navigator.pop(context,w);
        print('3:');
      print( _selectedItems);
    }
  }

//price


  void _mylist2() async {
    final List<String> itemss = type;
   
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return multselect(items: itemss);
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
//  await _runFilter2(_selectedItems);
var w= await _runFilter2(_selectedItems);
      Navigator.pop(context,w);
//Navigator.pop(context, await _runFilter2(_selectedItems));
      print('3:');
      print( _selectedItems);
    }
  }


  @override
  Widget build(BuildContext context) {
 //list=widget.carModel;
    return Scaffold(
      backgroundColor: kBgColor,
appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kBgColor,
        iconTheme: IconThemeData(color: Color.fromRGBO(49, 81, 113, 1),),
        title: Text("Filter Cars ",style: TextStyle(
                           fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                                          color: Colors.white)),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )
          ),
        ),
        ),
        // actions: [
        //   Container(
        //     margin: EdgeInsets.only( top: 16, right: 16,),
        //     child: Stack(
        //       children: <Widget>[
        //         Icon(Icons.notifications),
        //         Positioned(
        //           right: 0,
        //           child: Container(
        //             padding: EdgeInsets.all(1),
        //             decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
        //             constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
        //             child: Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
        //           ),
        //         )
        //       ],
        //     ),
        //   )
        // ],
      
      // appBar: AppBar(
      //   elevation: 0.3,
      //   backgroundColor: Color.fromRGBO(49, 81, 113, 1),
      //   foregroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.white),
      //   title: Text("Filter Cars "),
        
       
      // ),
      body: Center(
       
        //padding: const EdgeInsets.all(20),
        child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
         // crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
        
                Container(
           
              
              child: ClipOval(
                
                child:Image(image:AssetImage('assets/images/company.png'),),
              ),
           
         
          ),
            
         
           
               Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Company',
                                      style: TextStyle(
                                         fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                                          color: Colors.white),
                                    ),
                                  ),
                                onPressed: _mylist,
                                ),
                              ),
                
  //           ElevatedButton(
  //               onPressed: _mylist,
  //               child: const Text(
  //                 ('Company'),
  //                  style: TextStyle(
  //                      fontSize: 20,
  //                      fontWeight: FontWeight.bold,
  //                      color: Colors.white),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //  backgroundColor:  Color.fromRGBO(49, 81, 113, 1),
  // ),
  //   ),
            Divider(
              height: 18,
            color: Colors.white,
            ),
          

             Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Car Type',
                                      style: TextStyle(
                                          fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: _mylist2,
                              
                                ),
                              ),
                                   Divider(
              height: 18,
             color: Colors.white,
            ),

     Divider(
              height: 18,
             color: Colors.white,
            ),
  Align(
     alignment: Alignment.centerLeft,
  child: Text(
                  (' Range of Price/Day: $_dvalue'),
                   style: TextStyle(
                    fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                       fontWeight: FontWeight.bold,
                       color: Color.fromRGBO(49, 81, 113, 1)),
                )),
                     Divider(
              height: 13,
             color: Colors.white,
            ),
    Slider(
    value: _value,
    onChanged: (double newValue) async{
        setState(() {
            _value = newValue;
            _dvalue=_value*6.0;
        });
        //List<CarModel> res=  await _runFilterPrice(_value);
        // print(res.elementAt(1).carname);
    },
    min: 0.0,
    max: 100.0,
    divisions: 20,
    label: '$_value',
    thumbColor :Color.fromARGB(255, 162, 140, 191),
    activeColor:Color.fromRGBO(49, 81, 113, 1),
    inactiveColor:HexColor('#bed9f3'),
    
    
),

 
               ElevatedButton(
                onPressed: () async {
    
                 list1= await _runFilterPrice(_dvalue);
                  Navigator.pop(context,list1);
  },
              

                child: Text(
                        'select',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                        ),
                      ),
                style: ElevatedButton.styleFrom(
   backgroundColor:  Color.fromRGBO(49, 81, 113, 1),
  ),),
   Divider(
              height: 60,
             color: Colors.white,
            ),
               Container(
                alignment: Alignment.bottomCenter,
                width: 200,
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Defult',
                                      style: TextStyle(
                                          fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',
                                          color: Colors.white),
                                    ),
                                  ),
                                   onPressed: () {
                                    Color:Colors.black;
                                    list1=ResetList;
                                     _value = 50.0;
                                     _dvalue = _value*6.0;
                                     Navigator.pop(context,list1);},
                               
                                 
                                ),
                              ),
  //           child: ElevatedButton(
  //                    child: const Text(
  //                 ('Reset'),
  //                  style: TextStyle(
  //                      fontSize: 15,
  //                      //fontWeight: FontWeight.bold,
  //                      color: Color.fromRGBO(49, 81, 113, 1)),
  //               ),
  //               style: ElevatedButton.styleFrom(
  //  backgroundColor:  Colors.white,
  // ),
  //   onPressed: () {list1=ResetList;}, )),
          ],
          
        ),

        
      ),
      
      
    );
    
  }
}
  
_runFilter(List<String> _selectedItems) async {
  list2.clear();

  for(int j=0;j<_selectedItems.length;j++){   
    print('inside For');
    for(int s=0;s<companyname2.length;s++){
       print('????');
    if(companyname2.elementAt(s).contains(_selectedItems.elementAt(j))){
   print('---');
        list2=list1.where(((id) =>id.id.contains(company.elementAt(s)))).toList();
      print(list2.toList());
      }
    }
 
    }
 
    print("insideList1");
   
    return list2;
}

_runFilter2(List<String> _selectedItems) async {
  list2.clear();
  
  print("ops");
  for(int j=0;j<_selectedItems.length;j++){   
    print('inside For*');
   
    
    for(int s=0;s<type.length;s++){
      print(type.elementAt(s).toLowerCase().contains(_selectedItems.elementAt(j).toLowerCase()));
    if(type.elementAt(s).toLowerCase().contains(_selectedItems.elementAt(j).toLowerCase())){
      list2+=list1.where(((id) =>id.carname.toLowerCase().contains(type.elementAt(s)))).toList();
       
      }
    }
    }
 
    print("insideList2");
   
    return list2;
}

_runFilterPrice( double _dvalue) async {
//print(_value);
    print("insideList2");
    //print(list1.where(((id) =>double.parse(id.price)<=_value)).toList());
    return ResetList.where(((id) =>double.parse(id.price)<=_dvalue)).toList();
}
