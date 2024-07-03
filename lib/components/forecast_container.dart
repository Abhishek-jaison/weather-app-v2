import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_weather_app/models/weather_model.dart';

import 'package:provider/provider.dart';
import 'package:new_weather_app/providers/weather_provider.dart';
import 'package:intl/intl.dart';

class ForecastContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final List<WeatherForecastModel> forecasts =
        weatherProvider.weather?.forecast ?? [];

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Next 12 Hour's Forecast",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                WeatherForecastModel forecast = forecasts[index];
                // Format the time to display hours and minutes
                String formattedTime =
                    DateFormat.jm().format(forecast.date); // Example: 2:30 AM

                return ListTile(
                  leading: Image.network(
                    'https://openweathermap.org/img/w/${forecast.icon}.png',
                    width: 50,
                    height: 50,
                  ),
                  title: Text(formattedTime), // Display formatted time here
                  subtitle:
                      Text('${forecast.temperature}°C - ${forecast.condition}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
