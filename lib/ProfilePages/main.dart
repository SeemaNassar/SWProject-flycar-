// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flycar/ProfilePages/page/profile_page.dart';
// import 'package:flycar/ProfilePages/themes.dart';
// import 'package:flycar/ProfilePages/utils/user_preferences.dart';





// class modi extends StatelessWidget {
//   static final String title = 'User Profile';

//   @override
//   Widget build(BuildContext context) {
//     final user = UserPreferences.getUser();

//     return ThemeProvider(
//       initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
//       child: Builder(
//         builder: (context) => MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: title,
//           home: ProfilePage(),
//         ),
//       ),
//     );
//   }
// }
