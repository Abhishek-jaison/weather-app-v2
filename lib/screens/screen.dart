//lib/screens/screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_weather_app/components/forecast_container.dart';
import 'package:new_weather_app/components/humidity.dart';
import 'package:new_weather_app/components/humidity_container.dart';
import 'package:new_weather_app/components/temperature_container.dart';
import 'package:new_weather_app/components/top_bar.dart';
import 'package:new_weather_app/components/wind_speed.dart';

import 'package:provider/provider.dart';
import 'package:new_weather_app/providers/weather_provider.dart';

class WeatherDetailsScreens extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;
  
    

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: weatherProvider.loading
          ? Center(child: CircularProgressIndicator())
          : weatherProvider.errorMessage != null
              ? Center(child: Text(weatherProvider.errorMessage!))
              : weather == null
                  ? Center(child: Text('No data'))
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TopBar(),
                            SizedBox(height: 20),
                            TemperatureContainer(),
                            SizedBox(height: 25),
                            HumidityContainer(),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WindSpeed(),
                                Padding(
                                  padding: EdgeInsets.only(right: 0),
                                  child: Humidity(),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ForecastContainer(),
                          ],
                        ),
                      ),
                    ),
    );
  }
}
