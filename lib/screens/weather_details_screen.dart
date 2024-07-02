// lib/screens/weather_details_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_weather_app/providers/weather_provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: weatherProvider.loading
          ? Center(child: CircularProgressIndicator())
          : weatherProvider.errorMessage != null
              ? Center(child: Text(weatherProvider.errorMessage!))
              : weather == null
                  ? Center(child: Text('No data'))
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'City: ',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Temperature: ${weather.temperature} °C',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Condition: ${weather.condition}',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 16),
                          Image.network('http://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                          SizedBox(height: 16),
                          Text(
                            'Humidity: ${weather.humidity}%',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Wind Speed: ${weather.windSpeed} m/s',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(

                            onPressed: () {
                              weatherProvider.fetchWeather(weather.city);
                            },
                           child: Image.asset('assets/icons/refresh.gif',width: 25,height: 25,color: Colors.grey[400],),
                          ),
                        ],
                      ),
                    ),
    );
  }
}
