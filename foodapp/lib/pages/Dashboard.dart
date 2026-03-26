import 'package:flutter/material.dart';
import 'package:foodapp/controller/demoTitle_controller.dart';
import 'package:foodapp/helper/checkInternet.dart';
import 'package:foodapp/model/demo_list.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Dashboard extends StatelessWidget {
  final DemoTitleController controller = Get.put(DemoTitleController());
  final box = Hive.box<DemoListModel>('demoListbox');

  void syncData() async {
    for (var item in controller.allTitle) {
      final demoList = DemoListModel(
        title: item.title,
        description: item.description,
        price: item.price.toString(),
      );
      box.add(demoList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name: Demo User',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    syncData();
                  },
                  child: Text('SYNC'),
                ),
              ],
            ),
          ),
          // Obx(() {
          //   return Text(controller.isInternetAvailable.toString());
          // }),
          Obx(() => Text('Internet Available: ${controller.isInternetAvailable.value}')),
          Obx(() {
            return 

          Expanded(
            child: controller.isInternetAvailable.value
                ? Obx(() {
                    if (controller.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (controller.allTitle.isEmpty) {
                      return Text('No Data Found');
                    }
                    return ListView.builder(
                      itemCount: controller.allTitle.length,
                      itemBuilder: (context, index) {
                        return _buildFoodItem(
                          controller.allTitle[index].title,
                          controller.allTitle[index].description,
                          controller.allTitle[index].price.toString(),
                        );
                      },
                    );
                  })
                : box.length != 0
                ? ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final item = box.getAt(index);
                      return _buildFoodItem(
                        item!.title,
                        item.description,
                        item.price,
                      );
                    },
                  )
                : Center(child: Text('No Data Found')),
          );
          }),
          // })
        ],
      ),
    );
  }

  Widget _buildFoodItem(String title, String description, String price) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: Text(
          price,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
