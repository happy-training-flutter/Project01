import 'package:flutter/material.dart';
import 'package:foodapp/pages/dashboard.dart';
import 'package:foodapp/pages/details.dart';
import 'package:foodapp/pages/introscreen.dart';
import 'package:foodapp/pages/login.dart';
import 'package:foodapp/pages/signup.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Introscreen(),
      '/signup': (context) => Signup(),
      '/login': (context) => Login(),
      '/dashboard': (context) => Dashboard(),
      '/details': (context) => Details(),
    }
  ));
}