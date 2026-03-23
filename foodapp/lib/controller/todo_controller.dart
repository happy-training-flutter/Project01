import 'package:get/get.dart';

class ToDoController extends GetxController {
  RxList<String> task = <String>['Build an Todo List', 'Fill the bottles'].obs;

  void deleteTask(item) {
    task.remove(item);
  }

  void addTask(item) {
    task.add(item);
  }
}