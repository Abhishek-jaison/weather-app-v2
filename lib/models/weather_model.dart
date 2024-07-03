// lib/models/weather_model.dart
import 'package:flutter/material.dart';

class WeatherModel with ChangeNotifier {
  String city;
  double temperature;
  String condition;
  String icon;
  int humidity;
  double windSpeed;
  DateTime date;
  double minTemp; // New field for minimum temperature
  double maxTemp; 
  double feelslike;
  List<WeatherForecastModel> forecast;



  WeatherModel({
   
    required this.forecast,
    required this.feelslike,
    required this.minTemp,
    required this.maxTemp,
    required this.date,
    required this.city,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
  });

  String get feelsLikePhrase {
    double diff = temperature - feelslike;

    if (diff > 3) {
      return "Humidity is making it \nfeel cooler";
    } else if (diff < -3) {
      return "Humidity is making it \nfeel warmer";
    } else {
      return "Temperature feels as \nexpected";
    }
  }
  
}
class WeatherForecastModel {
  DateTime date;
  double temperature;
  String condition;
  String icon;

  WeatherForecastModel({
    required this.date,
    required this.temperature,
    required this.condition,
    required this.icon,
  });

}