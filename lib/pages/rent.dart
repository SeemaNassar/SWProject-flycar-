import 'package:flycar/konstants.dart';
// import 'package:flycar/model/car_model.dart';
import 'package:flycar/screens/home_screen/home_screen.dart';

import 'package:flutter/material.dart';
//import 'lib/screens/details_screen/details_screen.dart';
// import 'package:flycar/screens/onboarding_screen/onboarding_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flycar/screens/details_screen/details_screen.dart';

void main() {
  runApp(rented());
}

class rented extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Car Rental',
        theme: ThemeData(
            accentColor: kSecondaryColor, primaryColor: kPrimaryColor),
        home: HomeScreen());
  }
}

class rent extends StatefulWidget {
  const rent({super.key});

  @override
  State<rent> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<rent> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
