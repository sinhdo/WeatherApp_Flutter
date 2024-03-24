import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/home/widgets/home_detail_weather.dart';
import 'package:weather_app/pages/home/widgets/home_location.dart';
import 'package:weather_app/pages/home/widgets/home_temperature.dart';
import 'package:weather_app/pages/home/widgets/home_weather_icon.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
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
              future: context.read<WeatherProvider>().getWeatherCurrent(),
              initialData: null,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(!snapshot.hasData){
                  return Container(
                    child: Text('No Data'),
                  );
                }
                WeatherData data = snapshot.data as WeatherData;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeWeatherIcon(nameIcon : data.weather[0].main),
                    HomeTemperature(temp: data.main.temp,),
                    HomeLocation(nameLocation : data.name),
                    SizedBox(height: 40),
                    HomeDetailWeather(humidity: data.main.humidity,speedWind: data.wind.speed,),
                  ],
                );
              })),
    );
  }
}
