import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    // Format current date to display only the date part
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: weatherProvider.loading
          ? Center(child: CircularProgressIndicator())
          : weatherProvider.errorMessage != null
              ? Center(child: Text(weatherProvider.errorMessage!))
              : weather == null
                  ? Center(child: Text('No data'))
                  : Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 30, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          
                          //returns the top bar with the location
                          const TopBar(),
                          const SizedBox(height: 20),

                          
                          
                          //returns the current temperature and related deatails
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: TemperatureContainer(),
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          
                          
                          //returns the feels like temperature
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: HumidityContainer(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          
                          
                          //returns the wind speed and humidity level
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WindSpeed(),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Humidity(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
    );
  }
}
