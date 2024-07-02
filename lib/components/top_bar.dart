import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:new_weather_app/providers/weather_provider.dart';
import 'package:intl/intl.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;
    if (weather == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey[400], size: 20),
            SizedBox(width: 10),
            Text('${weather.city}', style: TextStyle(color: Colors.white)),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            weatherProvider.fetchWeather(weather.city);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shadowColor: Colors.transparent,
          ),
          child: Icon(Icons.refresh, color: Colors.white, size: 20),
        ),
      ],
    );
  }
}
