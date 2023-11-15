import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/home.dart';


void main(){
  return runApp(WeatherApp());
}


class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      theme: ThemeData(fontFamily: 'Almendra'),


      home: home(),
    );
  }
}
