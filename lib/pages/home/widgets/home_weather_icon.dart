import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/apps/utils/const.dart';

class HomeWeatherIcon extends StatelessWidget {

 final String nameIcon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.all(20),
      width: size.width / 1.5,
      child: Image.asset(
       AssetCustom.getLinking(nameIcon),
        fit: BoxFit.cover,
      ),
    );
  }

  HomeWeatherIcon({required this.nameIcon});
}
