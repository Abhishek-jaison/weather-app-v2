import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_weather_app/models/weather_model.dart';

class WeatherService {
  static const String _apiKey = '4615a528b89bb02e803efe9b39b333e8';
  static const String _baseUrl1 = 'http://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$_baseUrl1?q=$city&appid=$_apiKey&units=metric'));
    
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<dynamic> fetchForecast(String city) async {
     const String _baseUrl2 = 'https://api.openweathermap.org/data/2.5/';
      final String url = '$_baseUrl2/forecast/?q=$city&appid=$_apiKey&units=metric';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load forecast data: ${response.statusCode}');
  }
  }

  
}