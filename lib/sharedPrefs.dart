import 'package:shared_preferences/shared_preferences.dart';
// void main() {
//   sharedPrefs.saveDates(DateTime.now(), DateTime.now());
// }
class sharedPrefs {
 static saveEmail(String tokemail,String tokid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("tokemail", tokemail);
    prefs.setString("userID", tokid);
    // ignore: avoid_print
    print(prefs.get("tokemail"));
  }
   static savewall(String wal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("wallet", wal);

  }
  static saveDates(String s,String e,String t) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("startdate", s);
    prefs.setString("enddate", e);
    prefs.setString("total", t);
    // ignore: avoid_print
    print(prefs.get("startdate"));
  }

  // static getToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString("token");

  //   return token.toString();
  // }

}