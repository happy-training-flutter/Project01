import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/pokemon_model.dart';

class DemoAPICalling extends StatefulWidget {
  @override
  State<DemoAPICalling> createState() => _DemoAPICallingState();
}

class _DemoAPICallingState extends State<DemoAPICalling> {
  List<dynamic>? names;

  void request() async {
    try {
      Response response = await Dio().get('https://pokeapi.co/api/v2/pokemon');
      print(response.data);

      PokemonModel pokemonModel = PokemonModel.fromJson(response.data);
      setState(() {
        names = response.data['results'];
        print("names is $names");
        // print("names is ${pokemonModel.count}");
        // names=pokemonModel.results;
        // print("names is ${pokemonModel.results?[0].name}");
      });
    } catch (e) {
      print("THE ERROR>>>>");
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(40.0),
        child: names != null && names!.isNotEmpty
            ? ListView.builder(
                itemCount: names!.length,
                itemBuilder: (context, index) {
                  return Text(names![index]["name"]);
                },
              )
            : Text("No data found"),
      ),
    );
  }
}
