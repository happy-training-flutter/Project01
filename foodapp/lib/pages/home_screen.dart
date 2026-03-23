import 'package:flutter/material.dart';
import 'package:foodapp/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    print("Home screen Build method call");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home screen", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                homeController.incrementA();
                print("Count ===>${homeController.a}");
              },
              child: Text("Click me"),
            ),
            // Obx(() {
            //   print("Text rebuild");
            //   return Text("Count = ${homeController.a}");
            // }),
            GetBuilder<HomeController>(
              builder: (controller) {
                return Text("Count = ${homeController.a}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
