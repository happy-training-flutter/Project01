import 'package:flutter/material.dart';
import 'package:foodapp/pages/dashboard.dart';
import 'package:foodapp/pages/details.dart';
import 'package:foodapp/pages/home_screen.dart';
import 'package:foodapp/pages/introscreen.dart';
import 'package:foodapp/pages/login.dart';
import 'package:foodapp/pages/signup.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(GetMaterialApp(
//     initialRoute: '/dashboard',
//     routes: {
//       '/': (context) => Introscreen(),
//       '/signup': (context) => Signup(),
//       '/login': (context) => Login(),
//       '/dashboard': (context) => Dashboard(),
//       '/details': (context) => Details(),
//     }
//   ));
// }
//
// void main() {
//   runApp(GetMaterialApp(
//     initialRoute: '/dashboard',
//     getPages: [
//       GetPage(name: '/', page: () => Introscreen()),
//       GetPage(name: '/signup', page: () => Signup()),
//       GetPage(name: '/login', page: () => Login()),
//       GetPage(name: '/dashboard', page: () => Dashboard()),
//       GetPage(name: '/details', page: () => Details()),
//     ],
//   ));
// }


void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // home: HomeScreen(),
    home: Dashboard(),
  ));
}