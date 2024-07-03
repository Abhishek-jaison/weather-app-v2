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
    final weatherData = await _weatherService.fetchWeather(city);
    final forecastData = await _weatherService.fetchForecast(city);

    _weather = WeatherModel(
      city: weatherData['name'],
      temperature: weatherData['main']['temp'],
      condition: weatherData['weather'][0]['description'],
      icon: weatherData['weather'][0]['icon'],
      humidity: weatherData['main']['humidity'],
      windSpeed: weatherData['wind']['speed'],
      date: DateTime.now(),
      minTemp: weatherData['main']['temp_min'],
      maxTemp: weatherData['main']['temp_max'],
      feelslike: weatherData['main']['feels_like'],
      forecast: _parseForecastData(forecastData),
    );

    _saveLastSearchedCity(city);
  } catch (e) {
    _errorMessage = e.toString();
  } finally {
    _loading = false;
    notifyListeners();
  }
}

List<WeatherForecastModel> _parseForecastData(dynamic forecastData) {
  List<WeatherForecastModel> forecasts = [];

  try {
    if (forecastData['list'] != null) {
      for (var forecast in forecastData['list']) {
        DateTime date = DateTime.fromMillisecondsSinceEpoch(forecast['dt'] * 1000);
        double temperature = forecast['main']['temp'].toDouble(); // Convert to double
        String condition = forecast['weather'][0]['description'];
        String icon = forecast['weather'][0]['icon'];

        forecasts.add(WeatherForecastModel(
          date: date,
          temperature: temperature,
          condition: condition,
          icon: icon,
        ));
      }
    }
  } catch (e) {
    print('Error parsing forecast data: $e');
    // Handle error gracefully, e.g., return empty list or throw specific exception
  }

  return forecasts;
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