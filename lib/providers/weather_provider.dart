import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/reponsitories/api_reponsitory.dart';

class WeatherProvider extends ChangeNotifier{
    Future<WeatherData> getWeatherCurrent () async{
     WeatherData result =  await ApiReponsitory.callApiGetWeather();
    return result;
    }
    Future<List<WeatherDetail>> getWeatherDetail () async{
     List<WeatherDetail> result =  await ApiReponsitory.callApiGetWeatherDetail();
    return result;
    }
}