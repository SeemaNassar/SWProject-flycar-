import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flycar/konstants.dart';

/*
class SendFeedbackPage extends StatefulWidget {
  @override
  _SendFeedbackPageState createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Send Feedback Page"),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SendFeedbackPage extends StatefulWidget {
  @override
  _SendFeedbackPageState createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RatingBar.builder(
          minRating: 1,
          itemBuilder: (context,_)=>Icon(Icons.star , color:Colors.amber) ,
       onRatingUpdate: ((rating) {}   ),
        ),
      ),
    );
  }
}
*/
class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: kBgColor,
        appBar: AppBar(
      leading: BackButton(
          color: kCyanColor,
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromRGBO(49, 81, 113, 1)),
        flexibleSpace: Container(
            decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),),
        ),
      ),
      
      body: Container(
            decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 60),
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/company.png'),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Please rate the service",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'halter',
                          fontSize: 20,
                          package: 'flutter_credit_card',
                    color: Color.fromARGB(253, 0, 5, 46),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.all(8.0),
                  itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  onRatingUpdate: (Rating) {
                    print(Rating);
                  }),
                    SizedBox(
                height: 20,
              ),
              Text(
                "Thank You",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'halter',
                  package: 'flutter_credit_card',
                  color: Color.fromARGB(253, 0, 5, 46),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
