import 'package:flycar/pages/login_page.dart';

class CompanyModel {
  late String name;
  late String id;
  late String email;
  late String password;
  late String user_type;
  late String location_company;
  late String stutes;

  CompanyModel(this.name, this.user_type,this.email, this.password,
      this.stutes, this.id,this.location_company);

  CompanyModel.fromJson(Map<String, dynamic> map) {
    this.name = map['name'];
    this.stutes = map['stutes'];
    this.email = map['email'];
    this.location_company = map['location_company'];
   this.user_type= map['user_type'];
    this.password = map['password'];
    this.id=map['id'].toString();
     
  }
}