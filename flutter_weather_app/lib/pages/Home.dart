import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color backgroundColor = Colors.red;
  String smiley = "☀️";
  int degrees = 46;
  String country = "🇲🇽";
  String type = '°C';
  String type2 = '°F';
  String type3 = '°C';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('Weather app'),
          centerTitle: true,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(smiley, style: TextStyle(fontSize: 100)),
              const SizedBox(
                height: 24,
              ),
              Text("$degrees$type",
                  style: TextStyle(fontSize: 80, color: Colors.white)),
              TextButton(
                child: Text(
                  '$country Cambiar de país',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                onPressed: changeWeather,
              ),
              TextButton(
                child: Text(
                  "$type2",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: changefar,
              ),
            ],
          ),
        ),
      );

  void changefar() {
    setState(() {
      double fahreneit = degrees * 1.8 + 32;
      degrees = fahreneit.toInt();
      type = '°F';
    });
  }

  void changeWeather() {
    final counter = Random().nextInt(6);

    setState(() {
      switch (counter) {
        case 0:
          smiley = '❄️';
          degrees = nextNumber(min: -20, max: 10);
          backgroundColor = Colors.blueAccent.shade700;
          country = '🇨🇦';
          type = '°C';
          break;

        case 1:
          smiley = '🌤️';
          degrees = nextNumber(min: 30, max: 45);
          backgroundColor = Colors.red;
          country = '🇧🇷';
          type = '°C';
          break;
        case 2:
          smiley = '💨';
          degrees = nextNumber(min: 20, max: 35);
          backgroundColor = Colors.deepPurple;
          country = '🇨🇺';
          type = '°C';
          break;
        case 3:
          smiley = '🌧️';
          degrees = nextNumber(min: 15, max: 25);
          backgroundColor = Colors.deepPurple;
          country = '🇨🇷';
          type = '°C';
          break;
        case 4:
          smiley = '🌥️';
          degrees = nextNumber(min: 20, max: 30);
          backgroundColor = Colors.deepPurple;
          country = '🇩🇪';
          type = '°C';
          break;
        case 5:
          smiley = '⛈️';
          degrees = nextNumber(min: 15, max: 20);
          backgroundColor = Colors.deepPurple;
          country = '🇩🇪';
          type = '°C';
          break;
      }
    });
  }

  int nextNumber({required int min, required int max}) =>
      min + Random().nextInt(max - min + 1);
}
