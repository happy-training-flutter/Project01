import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/desktop_images.dart';

class Demo2 extends StatefulWidget {
  const Demo2({super.key});

  @override
  State<Demo2> createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {

  List<dynamic> demoData = [];
  List<DesktopImages>? newData; //Declaration: newData is currently null

  


  Future<List<DesktopImages>> fetchImages() async {
    Dio dio = Dio();

    final response = await dio.get("https://picsum.photos/v2/list");

    if (response.statusCode == 200) {
      List data = response.data;

      return data.map((e) => DesktopImages.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load images");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // callAPI();
    getData();
  }

  getData() async {
    newData=await fetchImages();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Image Listing'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: newData!=null ?ListView.builder(
        itemCount: newData!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(newData![index].downloadUrl),maxRadius: 45,),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(newData![index].author),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ):Text("No data"),
    );
  }
}
