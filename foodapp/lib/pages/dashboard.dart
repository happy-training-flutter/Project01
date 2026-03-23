import 'package:flutter/material.dart';
import 'package:foodapp/controller/todo_controller.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ToDoController controller = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20.0),
          child:
            Obx(() => Column(
              children: controller.task.map((item) {
                return Row(
                  children: [
                    Text(item),
                    ElevatedButton(child: Text('DELETE'), onPressed: () { controller.deleteTask(item); })
                  ]
                );
              }).toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          final TextEditingController textController = TextEditingController();

          Get.defaultDialog(
            title: 'Add Task',
            content: TextField(
              controller: textController,
              autofocus: true,
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                    controller.addTask(textController.text);
                    Get.back();
                },
                child: Text('ADD'),
              ),
            ],
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}