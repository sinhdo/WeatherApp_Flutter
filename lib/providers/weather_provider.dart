import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/reponsitories/api_reponsitory.dart';

class WeatherProvider extends ChangeNotifier{
  Position? position;
  String nameCity='Ha Noi';
  updatePositon(Position positionCurrent){
    position = positionCurrent;
    notifyListeners();

  }
    Future<WeatherData> getWeatherCurrent () async{
     WeatherData result =  await ApiReponsitory.callApiGetWeather(position);
     nameCity  = result.name;
     notifyListeners();
    return result;
    }
    Future<List<WeatherDetail>> getWeatherDetail () async{
     List<WeatherDetail> result =  await ApiReponsitory.callApiGetWeatherDetail(position);
    return result;
    }
}