import 'package:flutter/material.dart';
import 'package:weatherapp/weather.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weahter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonTheme: ButtonThemeData(buttonColor: Colors.yellow),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 217, 0, 255),
        ),
      ),
      home: MyHome(),
    );
  }
}
