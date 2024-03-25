import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/detail/widget/detail_body.dart';
import 'package:weather_app/providers/weather_provider.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff1d6cf3),
          Color(0xff19d2fe),
        ],
      )),
      child: FutureBuilder(
        future: context.read<WeatherProvider>().getWeatherDetail(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
          }
          if(!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          List<WeatherDetail> listData = snapshot.data as List<WeatherDetail>;
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  Icon(CupertinoIcons.location),
                  SizedBox(
                    width: 15,
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        '${context.read<WeatherProvider>().nameCity} City',
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        speed: const Duration(milliseconds: 100),
                      )
                    ],
                  )
                ],
              ),
              actions: [
                Icon(CupertinoIcons.search),
                SizedBox(
                  width: 15,
                )
              ],
            ),
            body: DetailBody(listData: listData),
          );
        }
      ),
    );
  }
}
