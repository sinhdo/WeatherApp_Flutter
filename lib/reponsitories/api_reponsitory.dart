import 'package:dio/dio.dart';
import 'package:weather_app/apps/utils/const.dart';
import 'package:weather_app/models/weather.dart';

class ApiReponsitory {
  static Future<WeatherData> callApiGetWeather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=20.999390&lon=105.733902&units=metric&appid=${MyKey.api_token}');
      final data = res.data;
      WeatherData result = WeatherData.fromMap(data);
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  static  Future<List<WeatherDetail>> callApiGetWeatherDetail () async{
    try{
      final dio = Dio();
      final res = await dio.get('https://api.openweathermap.org/data/2.5/forecast?lat=20.999390&lon=105.733902&units=metric&appid=${MyKey.api_token}');
      List data  =res.data['list'];
    List<WeatherDetail> result =
        List<WeatherDetail>.from(data.map((e)=>WeatherDetail.fromMap(e)).toList()) ;
      return result;
    }catch(e){
      print(e);
      rethrow;
    }

  }
}
