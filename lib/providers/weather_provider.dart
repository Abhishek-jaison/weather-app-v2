// lib/providers/weather_provider.dart
import 'package:flutter/material.dart';
import 'package:new_weather_app/models/weather_model.dart';
import 'package:new_weather_app/services/weather_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;
  WeatherService _weatherService = WeatherService();
  bool _loading = false;
  String? _errorMessage;

  WeatherModel? get weather => _weather;
  bool get loading => _loading;
  String? get errorMessage => _errorMessage;

 Future<void> fetchWeather(String city) async {
  _loading = true;
  _errorMessage = null;
  notifyListeners();

  try {
    final data = await _weatherService.fetchWeather(city);
    _weather = WeatherModel(
      city: data['name'],
      temperature: data['main']['temp'],
      condition: data['weather'][0]['description'],
      icon: data['weather'][0]['icon'],
      humidity: data['main']['humidity'],
      windSpeed: data['wind']['speed'],
      date: DateTime.now(),
      minTemp: data['main']['temp_min'], // Example: Adjust based on your API response
      maxTemp: data['main']['temp_max'],
      feelslike: data['main']['feels_like'],
    
    );
    _saveLastSearchedCity(city);
  } catch (e) {
    _errorMessage = e.toString();
  } finally {
    _loading = false;
    notifyListeners();
  }
}

void _saveLastSearchedCity(String city) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('lastSearchedCity', city);
}

Future<String?> getLastSearchedCity() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('lastSearchedCity');
}
}