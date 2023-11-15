import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String apiKey = '033511f1161ec331a3c53e4b02444913';
  String city = '';
  String temperature = '';
  String description = '';
  String weatherImage = 'images/weather-app.png';

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchWeather() async {
    final Uri uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        temperature = (data['main']['temp'] - 273.15).toStringAsFixed(2);
        description = data['weather'][0]['description'];

        if (double.parse(temperature) > 30) {
          weatherImage = 'images/hot.png';
        } else if (double.parse(temperature) >= 20 && double.parse(temperature) <= 30) {
          weatherImage = 'images/warm.png';
        } else if (double.parse(temperature) >= 10 && double.parse(temperature) < 20) {
          weatherImage = 'images/mild.png';
        } else if (double.parse(temperature) >= 0 && double.parse(temperature) < 10) {
          weatherImage = 'images/cool.png';
        } else {
          weatherImage = 'images/cold.png';
        }
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(height: 20),

                  TextField(
                    onChanged: (value) {
                      city = value;
                    },
                    onEditingComplete: () {
                      setState(() {
                        fetchWeather();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter City',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                    cursorColor: Colors.orange, // Set the cursor color to orange
                  ),




                  SizedBox(height: 20),

                  Text('Today\'s Weather', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                  Divider(thickness: 5, color: Colors.orange),

                  SizedBox(height: 20),

                  Image(image: AssetImage(weatherImage)),

                  SizedBox(height: 20),
                  Text('Current Temperature: $temperature °C', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Text('Weather Status: $description', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Text('City: $city', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}







