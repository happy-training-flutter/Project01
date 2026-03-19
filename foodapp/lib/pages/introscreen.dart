import 'package:flutter/material.dart';

class Introscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Food Application'),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.all(20),
              child: Center(
                child: Image.network('https://images.unsplash.com/photo-1649011402835-695fa15c160b?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboard');
                      },
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text('SignUp'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
