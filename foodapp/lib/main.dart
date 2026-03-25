import 'package:flutter/material.dart';
import 'package:foodapp/model/person.dart';
import 'package:foodapp/pages/localStorage01.dart';
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
    // home: Dashboard(),
    home: Localstorage01()
  ));
}