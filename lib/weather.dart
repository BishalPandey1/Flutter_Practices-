import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 170, 123, 235),
              Color.fromARGB(255, 244, 98, 247),
              Color.fromARGB(255, 176, 32, 219),
              Color.fromARGB(255, 196, 100, 227),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assests/cloud.png', height: 200, width: 200),
            Text(
              "Weather",
              style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
            ),
            Text(
              "Forecasts",
              style: TextStyle(
                fontSize: 64,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            FilledButton(onPressed: () {}, child: Text("Get Started")),
          ],
        ),
      ),
    );
  }
}
