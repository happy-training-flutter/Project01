import 'dart:math';

import 'package:dio/dio.dart';
import 'package:foodapp/helper/checkInternet.dart';
import 'package:foodapp/model/demo_title.dart';
import 'package:get/get.dart';

class DemoTitleController extends GetxController {
  RxList<Product> allTitle = <Product>[].obs;
  RxBool isLoading = true.obs;
  RxBool isInternetAvailable = false.obs;

  @override
  void onInit() async{
    super.onInit();
    fetchTitles();

    print('CHECKING INTERNET CONNECTION...');
    print(await checkInternet());
    isInternetAvailable.value = await checkInternet();
    // update();
    print('INTERNET AVAILABILITY: $isInternetAvailable');
  }

  Future<void> fetchTitles() async {
    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 5));

      final response = await Dio().get('https://dummyjson.com/products');

      DemoTitle finalData = DemoTitle.fromJson(response.data);
      allTitle.assignAll(finalData.products); // Works in MVC structure

      // Get.snackbar('Success', 'Data fetched successfully.');

    } catch (e) {
      print('Error fetching titles: $e');
      // Get.snackbar('Error', 'Failed to fetch data. Please try again. $e');
    } finally {
      isLoading.value = false;
    }
  }
}
