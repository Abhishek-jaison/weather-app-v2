// lib/main.dart
import 'package:flutter/material.dart';
import 'package:new_weather_app/screens/splash_screen.dart';
import 'package:new_weather_app/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:new_weather_app/providers/weather_provider.dart';
import 'package:new_weather_app/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final weatherProvider = WeatherProvider();
  
  final lastCity = await weatherProvider.getLastSearchedCity();
  if (lastCity != null) {
    await weatherProvider.fetchWeather(lastCity);
  }
  runApp(
    
    ChangeNotifierProvider.value(
      value: weatherProvider,
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Weather App',
      theme: darkMode,
      home: const SplashScreen(),
    );
  }
}
