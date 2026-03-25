import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/demoTitle_controller.dart';

class Demo4 extends StatelessWidget {
  Demo4({super.key});

  final DemoTitleController controller = Get.put(DemoTitleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API CALLING DEMO-03'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.allTitle.isEmpty) {
            return Text('No Data Found');
          }
          return ListView.builder(
            itemCount: controller.allTitle.length,
            itemBuilder: (context, index) {
              return Text(controller.allTitle[index].title);
            },
          );
        }),
      ),
    );
  }
}
