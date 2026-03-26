import 'package:flutter/material.dart';
import 'package:foodapp/model/demo_list.dart';
import 'package:foodapp/model/note_model.dart';
import 'package:foodapp/pages/DashBoard.dart';
import 'package:foodapp/pages/NotesScreen.dart';
import 'package:foodapp/pages/localStorage01.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

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


void main()async{

  await Hive.initFlutter();
  // Hive.registerAdapter(NoteModelAdapter());

  // await Hive.openBox<NoteModel>('notesBox');

  Hive.registerAdapter(DemoListModelAdapter());
  await Hive.openBox<DemoListModel>('demoListBox');

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // home: HomeScreen(),
    home: Dashboard(),
    // home: NotesScreen()
  ));
}