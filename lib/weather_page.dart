// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:weatherapp/api.dart';

class WeatherPage extends StatefulWidget {
  final String cityName;

  const WeatherPage({Key? key, required this.cityName}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather? weather;
  void getWeatheer() async {
    try {
      var response = await Dio().get(
        "https://api.weatherapi.com/v1/current.json?q=${widget.cityName}&key=cea57194c4c54658a6533401251111",
      );
      final data = response.data;

      setState(() {
        weather = Weather.fromMap(data);
      });

      // final Weather Weather;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatheer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weather == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                  colors: [
                    Color(0xFF20284d),
                    Color(0xFF453b91),
                    Color(0xFF9342ab),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Image.asset('assests/cloud.png', height: 200),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather!.tempcelsious.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'oC',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Text(
                    weather!.currentCondition,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Max: 24',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'o',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Min: 24',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'o',
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 8,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset('assests/homewint.png', height: 200),
                ],
              ),
            ),
    );
  }
}
