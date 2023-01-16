import 'dart:collection';
import 'dart:convert';
import 'package:flycar/api/model/company_model.dart';
import 'package:flycar/konstants.dart';
import 'package:flycar/api/model/car_model.dart';
import 'package:flycar/screens/home_screen/filter.dart';
import 'package:flycar/sharedPrefs.dart';
import 'package:flycar/size_config.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'car_model_card.dart';
import '/api/fetchData.dart';
import 'package:http/http.dart' as http;

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
//String ur=172.19.242.120;
//List<CarModel> carmodel=[];
var carmodel;
var c;
late List<CarModel> list1;
late List<CarModel> listfilter;
late var listcarRent;
late List<CarModel> list1D;
late List<CompanyModel> allcmp;
late List<CarModel> finalList;
late List<CarModel> finalListRR;
 late List<int> Dlist;
 late List<int> D;
 late List<int> Dfinal;
late DateTime start;
late DateTime end;
String _searchTerm = '';

int fil=0;

late String EndSession ;
late String StartSession;
late String totalSession;
  Future<List<CarModel>> fetchAllCars() async {
     if(fil==1){
      fil=0;
      return list1;
    }
    else{
  Dlist.clear();
  StartSession = prefs.get("startdate").toString();
EndSession = prefs.get("enddate").toString();
String totalSession = prefs.get("total").toString();
  
      print("hi1"+StartSession);
         print("hi2"+EndSession);      
    var res1= await http.get( Uri.parse(fetchData.baseURL+'/carRentDate?startDate='+StartSession +
              '&&endDate='+StartSession));
               var body1 = jsonDecode(res1.body) as List;
               listcarRent=body1;
              for(int i=0;i<body1.length;i++){
Dlist.add(body1.elementAt(i)['carid']);
              }
              print(Dlist);
      var res= await http.get( Uri.parse(fetchData.baseURL+'/car'));      
    var body = jsonDecode(res.body) as List;
    list1=List<CarModel>.from(body.map((i) => CarModel.fromJson(i)));
    finalListRR=list1;

    DateTime s=DateTime.now();
    print('insidefetch');
    print(s.toString());
    //_runDates();
    _filterDate(StartSession,EndSession);
    return body.map((car) => CarModel.fromJson(car)).toList();
  }
  }
//////
 Future<List<CompanyModel>> fetchAllCompany() async {
   
    var res= await http.get( Uri.parse(fetchData.baseURL+'/company'));
               var body = jsonDecode(res.body) as List;
               print("++++++++++++");
    print(res);
    allcmp=List<CompanyModel>.from(body.map((i) => CompanyModel.fromJson(i)));
   
    return body.map((i) => CompanyModel.fromJson(i)).toList();
  
  }
  @override
  void initState() {
     list1=[];
list1D=[];
  Dlist=[];
  D=[];
  Dfinal=[];
  listcarRent=[];
  finalList=[];
  finalListRR=[];
 EndSession ='';
 StartSession='';
 totalSession='';
  allcmp=[];
 

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchAllCompany();
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
         // SearchBar(),
          Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateWidth(12),
          vertical: getProportionateHeight(20)),
      child: TextField(
        //autocorrect: true,
         onChanged: (value) {
              setState(() {
                
                _searchTerm = value;
            
              });
            },
      

        decoration: InputDecoration(
          filled: true,
          fillColor: kCyanColor.withOpacity(0.8),
          hintText: 'Search Cars',
          hintStyle: TextStyle(color: Colors.white,fontFamily: 'halter',
                          fontSize: 12,
                          package: 'flutter_credit_card',),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
              
          ),
          suffixIcon: Container(
            height: getProportionateHeight(52),
            child: Icon(
              Icons.search,
              size: 40,
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              
              ),
            ),
          ),
        ),
      ),
    ),
          // BuildCircle(),
          Container(
            margin: EdgeInsets.only(
                right: getProportionateWidth(15),
                left: getProportionateWidth(15),
                top: getProportionateHeight(10),
                bottom: getProportionateHeight(0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Cars',
                  style: TextStyle(fontFamily: 'halter',
                          fontSize: 18,
                          package: 'flutter_credit_card',color:Color.fromRGBO(49, 81, 113, 1),)
                ),
                Container(
                  width: getProportionateWidth(40),
                  height: getProportionateHeight(40),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 5,
                          color: kCyanColor.withOpacity(0.5))
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: kCyanColor.withOpacity(0.8),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  
                    child: IconButton(
                        icon: Icon(Icons.filter_alt, color: Colors.white,),
                       
                          onPressed: () async {
                      var result = await Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) {
                        return filter(carModel: _filterDate(StartSession,EndSession));
                      }));
                      print("result");
                      print(result.toString());
                      list1=result;
                      fil=1;
                       _runFilter();
                       setState(() {
                        list1=result;
                       });
                      
                    },
                      
                        ),
                               
                )
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          AllCars(),
        ],
      ),
    );
  }

  Widget AllCars() {
    return FutureBuilder(
        future: fetchAllCars(),
        builder: (context, snapchot) {
          if(snapchot.data != null) {
  carmodel = snapchot.data as List<CarModel>;

} 
          return snapchot.data == null
              ? CircularProgressIndicator(
                  value: 0.8,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                )
              : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: carmodel == null ? 0 : 
                  _runFilter().length,
                  //carmodel.length,
                  itemBuilder: (context, index) {
                    return CarModelCard(carModel: _runFilter()[index],companyModel:allcmp);
                  });
        });
  }

  _runFilter() {
   
    return list1.where((name) => name.carname.toLowerCase().contains((_searchTerm).toLowerCase())).toList();
}

  _runDates() {
    D.clear();
    list1D.clear();
    Dfinal.clear();
  
        for(int w=0;w<list1.length;w++){
  D.add(int.parse(list1.elementAt(w).carid));
        }
  
    D.sort();
    Dlist.sort();
    print("sss");
    print(D); 
    for(int x=0;x<D.length;x++){
      int f=0;
      for(int i=f;i<Dlist.length;i++){
        
        if(D.elementAt(x)==Dlist.elementAt(i)){
         
          f=i;
           i=Dlist.length;
         
      }
      else{
         Dfinal.add(D.elementAt(x));
        print(D.elementAt(x));
      }
     
    }  }
        for(int j=0;j<Dfinal.length;j++){
    list1D+=list1.where((name) => (name.carid.contains(Dfinal.elementAt(j).toString()))).toList();
    }
    list1=list1D;
    print("insideList1");
   
    return list1;
}

///////
_filterDate(String s, String e) {
  Dfinal.clear();
  finalList.clear();
  for(int i=0;i<listcarRent.length;i++){
    String start=listcarRent.elementAt(i)['startDate']; //from db
    String end=listcarRent.elementAt(i)['endDate'];  //from db
final startS =start.split('-'); 
final t =startS.elementAt(2).split('T'); 
startS.insert(2,t.elementAt(0));
startS.removeAt(3);
final ss =s.split('-');//selected
///
final endS =end.split('-');
final tt =endS.elementAt(2).split('T');
endS.insert(2,tt.elementAt(0));
endS.removeAt(3);
final es =e.split('-');//selected

if(int.parse(startS.elementAt(0))==int.parse(ss.elementAt(0))){
  print('if11');
  if(int.parse(startS.elementAt(1))==int.parse(ss.elementAt(1))){
    print('if12');
  if((int.parse(startS.elementAt(2))+1>int.parse(ss.elementAt(2)))&&(int.parse(endS.elementAt(2))+1>int.parse(ss.elementAt(2)))&&(int.parse(startS.elementAt(2))+1>int.parse(es.elementAt(2)))){
    print('if13');
    print(list1.where((element) => element.carid.toString().contains(listcarRent.elementAt(i)['carid'].toString())).toList());
finalList+=list1.where((element) => element.carid.toString().contains(listcarRent.elementAt(i)['carid'].toString())).toList();
print('if1');
  }
  else if((int.parse(endS.elementAt(2))+1<int.parse(ss.elementAt(2)))&&(int.parse(startS.elementAt(2))+1<int.parse(ss.elementAt(2)))){
finalList+=list1.where((element) => element.carid.toString().contains(listcarRent.elementAt(i)['carid'].toString())).toList();
print('if2');
  } 

  }
  else if(((int.parse(startS.elementAt(1))>int.parse(ss.elementAt(1)))&&(int.parse(endS.elementAt(1))>int.parse(ss.elementAt(1))))
  ||((int.parse(startS.elementAt(1))<int.parse(ss.elementAt(1)))&&(int.parse(endS.elementAt(1))<int.parse(ss.elementAt(1))))){
finalList+=list1.where((element) => element.carid.toString().contains(listcarRent.elementAt(i)['carid'].toString())).toList();
print('if3');

  }
  print('here');
}
  else if((int.parse(startS.elementAt(0))>int.parse(ss.elementAt(0)))&&(int.parse(endS.elementAt(0))>int.parse(ss.elementAt(0)))){
finalList+=list1.where((element) => element.carid.toString().contains(listcarRent.elementAt(i)['carid'].toString())).toList();
print('if4');

  }
Dlist.add(listcarRent.elementAt(i)['carid']);


  }

 
  for(int x=0;x<Dlist.length;x++){
  // print("*****");
  // print(Dlist);
  finalListRR.removeWhere((element) => element.carid.toString().contains(Dlist.elementAt(x).toString())); // remove car collect at this time
  }
   
finalList=removeDuplicate(); //the car is out of range for many times 
  list1=finalList+finalListRR; //out of range and not have any dates
    return list1;
}
////////
 removeDuplicate() {
  List<CarModel> arr = finalList;
  List<CarModel> result = LinkedHashSet<CarModel>.from(arr).toList();
  print(result);
  print(result.length); 
  return result;
}
///

}
