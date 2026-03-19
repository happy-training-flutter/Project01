import 'package:flutter/material.dart';

class Foodcard extends StatefulWidget {

  @override
  State<Foodcard> createState() => _FoodcardState();
}

class _FoodcardState extends State<Foodcard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Column(
        children: [
          Image.network('https://images.unsplash.com/photo-1544982503-9f984c14501a?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Pizza',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '200.00',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20.0,
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
