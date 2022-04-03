import 'dart:convert';

import 'package:app_weather_2/model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient{
  //api: https://api.openweathermap.org/data/2.5/weather?q=Hanoi&lang=en&appid=da366a22304bdc73cba13d51853d4ece&units=metric
  Future<Weather> getCurrentWeather(String location) async{
    var result = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&lang=en&appid=da366a22304bdc73cba13d51853d4ece&units=metric');
    var response = await http.get(result);
    var body = jsonDecode(response.body);
    // print(Weather.fromJson(body).image);
    // print(Weather.fromJson(body).status);
    return Weather.fromJson(body);
  }
}