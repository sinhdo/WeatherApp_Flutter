import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  final num humidity;
  final num speedWind;

  HomeDetailWeather({required this.humidity, required this.speedWind});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/icons/wind.png'),
            Text(
              '${speedWind} km/h',
              style: TextStyle(fontSize: 21, color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/icons/humidity.png'),
            Text(
              '${humidity}%',
              style: TextStyle(fontSize: 21, color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
