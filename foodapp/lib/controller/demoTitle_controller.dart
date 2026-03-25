import 'package:dio/dio.dart';
import 'package:foodapp/model/demo_title.dart';
import 'package:get/get.dart';

class DemoTitleController extends GetxController {
  RxList<Product> allTitle = <Product>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTitles();
  }

  Future<void> fetchTitles() async {
    isLoading.value = true;
    try {
      // Adds a 5-second pause before making the API call
      await Future.delayed(const Duration(seconds: 5));

      final response = await Dio().get('https://dummyjson.com/products');

      DemoTitle finalData = DemoTitle.fromJson(response.data);
      print(finalData.products);
      allTitle.assignAll(finalData.products); // Works in MVC structure
      // allTitle = finalData.products;
    } finally {
      isLoading.value = false;
    }
  }
}
