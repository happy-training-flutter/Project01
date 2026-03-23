// import 'package:flutter/material.dart';
//
// class Details extends StatefulWidget {
//   const Details({super.key});
//
//   @override
//   State<Details> createState() => _DetailsState();
// }
//
// class _DetailsState extends State<Details> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Text('Details')
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:foodapp/controller/home_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Details extends GetView<HomeController> {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(controller.a.toString()),),
    );
  }
}
