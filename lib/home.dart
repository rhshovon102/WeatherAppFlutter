import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/weather_screen.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey4,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(

              children: [

                Expanded(child: Image(image: AssetImage('images/weather-app.png'))),

                Expanded(
                  child: Container(
                    child: Text("WELCOME",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.orange)),
                  ),
                ),




                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll<Color>(CupertinoColors.systemGrey5)
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WeatherScreen())
                              );
                            },
                            child: Text("KickOff",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.orange)))
                    )
                  ],
                ),
                SizedBox(height: 10)

              ],


            ),
          ),
        ),
      ),

    );
  }
}