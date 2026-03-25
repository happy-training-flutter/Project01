import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/demo_title.dart';

class Demo3 extends StatefulWidget {
  @override
  State<Demo3> createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {

  List<Product>? allTitle;
  
  Future<List<Product>> fetchTitles() async {
    final response = await Dio().get('https://dummyjson.com/products');

    DemoTitle finalData = DemoTitle.fromJson(response.data);
    print(finalData.products);

    return finalData.products;
  }

  void addTitle() async{
    allTitle = await fetchTitles();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addTitle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API CALLING DEMO-03'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20.0),
        child: allTitle != null ?
          ListView.builder(
            itemCount: allTitle!.length,
            itemBuilder: (context, index) {
              return Text(allTitle![index].title);
            }
          ) : Text("No Data Found"),
      ),
    );
  }
}
