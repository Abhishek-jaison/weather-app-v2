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
              'Next 5 Days Forecast',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: forecasts.length,
              itemBuilder: (context, index) {
                WeatherForecastModel forecast = forecasts[index];

                // Print statement to check if dates are correct
                print('Forecast Date: ${forecast.date}');

                String formattedDate =
                    DateFormat('dd/MM/yyyy').format(forecast.date);

                return ListTile(
                  leading: Image.network(
                    'https://openweathermap.org/img/w/${forecast.icon}.png',
                    width: 50,
                    height: 50,
                  ),
                  title: Text(formattedDate),
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
