import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:new_weather_app/providers/weather_provider.dart';
import 'package:intl/intl.dart';

class TemperatureContainer extends StatelessWidget {
  TemperatureContainer({super.key});
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;

    // Format current date to display only the date part
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (weather == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.5), // Adjust opacity and colors as needed
            Colors.blueAccent.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 1, 40, 70)
                .withOpacity(0.5), // Adjust shadow color and opacity
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      // padding: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' $formattedDate',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 5),
            Text(
              weather.condition,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  '${weather.temperature.round()}°C',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Min: ${weather.minTemp.round()}°C',
                      style: TextStyle(color: Colors.white70),
                    ),
                    Text(
                      'Max: ${weather.maxTemp.round()}°C',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),

            // Add more weather details as needed
          ],
        ),
      ),
    );
  }
}
