import 'package:get/get.dart';

class HomeController extends GetxController{

  RxInt count =0.obs;
  int a=0;

  void increment(){
    count.value++;
    a++;
    update();
  }

  void incrementA(){
    a++;
    update();
  }
}