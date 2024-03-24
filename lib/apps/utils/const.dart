import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const linkAsset = 'assets/images/weathers/';
class AssetCustom{
  static String getLinking (String name)=> '$linkAsset${name.replaceAll(' ', '').toLowerCase()}.png';
}
class MyKey{
  static const String api_token='701c72abecd3573fd7dfa15d7498739d';
}

Widget createTemp(num temp,{double size=100 }){
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temp.round().toString(),
          style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Text(
          '0',
          style: TextStyle(
            fontSize: size/3,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ]);
}