import 'dart:io';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flycar/ProfilePages/page/profile_page.dart';
import 'package:flycar/ProfilePages/widget/button_widget.dart';
import 'package:flycar/ProfilePages/widget/profile_widget.dart';
import 'package:flycar/ProfilePages/widget/textfield_widget.dart';
import 'package:flycar/api/model/car_model.dart';
import 'package:flycar/api/model/user_model.dart';
import 'package:flycar/main.dart';
import 'package:flycar/sharedPrefs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'dart:async';
import '../../konstants.dart';
import '/api/fetchData.dart';
class EditProfilePage extends StatefulWidget {
  @override
   final userModel usermodel;
  
  const EditProfilePage({required this.usermodel});
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
late userModel usermodel1;
late List<String> fills;
 String fn='';
 String ln='';
 String e='';
 String p='';
 String m='';
  @override
  void initState() {
    super.initState();
fills=[];
print("object");
print(widget.usermodel);

fn=widget.usermodel.firstname;
ln=widget.usermodel.lastname;
e=widget.usermodel.email;
p=widget.usermodel.password;
m=widget.usermodel.Mobile_number;

  }

  @override
  Widget build(BuildContext context) {
              if(widget.usermodel!=null){
           usermodel1 = widget.usermodel ;

          print(usermodel1);
          }
          return widget.usermodel == null
              ? Text("Loading..")
              :
 
          Scaffold(
             backgroundColor: kBgColor,
                  appBar: AppBar(
        leading: BackButton(
          color: kCyanColor,
        ),
      
        backgroundColor: kBgColor,
        elevation: 0,
      ),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                
                ProfileWidget(
                imagePath:'https://static.vecteezy.com/system/resources/thumbnails/000/367/333/small/Universal__28138_29.jpg',
                  isEdit: true, onClicked: () {  },
                  // onClicked: () 
                  // async {
                  //   final image = await ImagePicker()
                  //       .getImage(source: ImageSource.gallery);

                  //   if (image == null) return;

                  //   final directory = await getApplicationDocumentsDirectory();
                  //   final name = basename(image.path);
                  //   final imageFile = File('${directory.path}/$name');
                  //   final newImage =
                  //       await File(image.path).copy(imageFile.path);

                  //   //setState(() => user = user.copy(imagePath: newImage.path));
                  // },

                ),
                Container(
                  alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(

             // shape: BoxShape.circle,
              image: DecorationImage(

                image: AssetImage('https://static.vecteezy.com/system/resources/thumbnails/000/367/333/small/Universal__28138_29.jpg'),
                opacity:1.0,
                //scale:0.5,
              ),
            ),
                ),
                const SizedBox(height: 18),
                TextFieldWidget(
                  label: 'First Name',
                  text: usermodel1.firstname,
                  onChanged: (fname) => {fn=fname,print(fn)}
                ),
               const SizedBox(height: 14),
                TextFieldWidget(
                  label: 'Last Name',
                  text:  usermodel1.lastname,
                  onChanged: (lname) => {ln=lname,print(ln)}
                ),
               const SizedBox(height: 14),
                TextFieldWidget(
                  label: 'Email',
                  text: usermodel1.email,
                  onChanged: (email) => e=email,
                ),
                const SizedBox(height: 18),
                TextFieldWidget(
                  label: 'Mobile Number',
                  text: usermodel1.Mobile_number,
                  onChanged: (mn) => m=mn,
                ),
            const SizedBox(height: 14),
                TextFieldWidget(
                  label: 'password',
                  text: usermodel1.password,
                  //maxLines: 5,
                  onChanged: (pass) => p=pass,
                ),
                const SizedBox(height: 18),
                ButtonWidget(
                  text: 'Save',
                  onClicked: () async{
                    await fetchadminDB();
                   // UserPreferences.setUser(user);
                     Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                  
                  },
                  style: TextStyle(color: Color.fromARGB(0, 0, 0, 0)),
                ),
              ],
            ),
          );
        
      }
////
   
///////
fetchadminDB() async {
try{
 print("inside 1");
 String id= prefs.get("userID").toString();
 sharedPrefs.saveEmail(e, id);
 print(ln);
 print(e);
 print(id);
      http.Response res = await http.get(
        //192.168.1.55 // 172.19.222.186
          Uri.parse(fetchData.baseURL+'/updateProfile?firstname='+ fn+'&&lastname='+ln+'&&email=' +e+'&&mobile_number='+m+
              '&&password='+p+'&&id='+id),
          headers: {'Content-Type': 'application/json'});
         // print(res.body.toString());
           print("inside 2");
  //}
    } catch (e) {
      print("no register");
    }
  }
  
}
