import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:new_weather_app/providers/weather_provider.dart';
import 'package:intl/intl.dart';

class WeatherDetailsScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;
      // Format current date to display only the date part
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: weatherProvider.loading
          ? Center(child: CircularProgressIndicator())
          : weatherProvider.errorMessage != null
              ? Center(child: Text(weatherProvider.errorMessage!))
              : weather == null
                  ? Center(child: Text('No data'))
                  : Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child:Container(
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
        color: Color.fromARGB(255, 1, 40, 70).withOpacity(0.5), // Adjust shadow color and opacity
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
              style: TextStyle(color: Colors.white, fontSize: 50),
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
),
                           
                             

                          ),
                          SizedBox(height: 25,),
                          
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(18),
                
                child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Column(
                  children: [
                        Text('Feels Like'),
                        Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('assets/icons/temperature.png',height: 25,width: 25,),
                             Text('${weather.feelslike.round()}°C', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                  ]
                ),
                Column(
                  children: [
                    Text(weather.feelsLikePhrase),
                  ],
                )]
              ),
            ),
          ) 
                          
                      ),],
                      ),
                    ),
    );
  }
}
