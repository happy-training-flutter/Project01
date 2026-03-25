import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Localstorage01 extends StatefulWidget {
  @override
  State<Localstorage01> createState() => _Localstorage01State();
}

// TITLE: LOCAL STORAGE USING SHARED PREFERENCES

class _Localstorage01State extends State<Localstorage01> {
  String? name;
  List<String>? hobbies;

  Future<void> saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('username', 'John Doe');
    await prefs.setStringList('hobbies', ['Reading', 'Gaming', 'Cooking']);
  }

  Future<void> readData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('username');
    hobbies = prefs.getStringList('hobbies');

    print(name);
    print(hobbies);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveData();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name'),
        centerTitle: true,
      ),
      body: hobbies != null ?
        ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Text(hobbies![index]);
          }
        ) : Text("No Data Found"),
    );
  }
}
