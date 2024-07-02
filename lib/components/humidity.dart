import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:new_weather_app/providers/weather_provider.dart';
import 'package:intl/intl.dart';

class Humidity extends StatelessWidget {
  const Humidity({super.key});

  @override
  Widget build(BuildContext context) {
        final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;

     if (weather == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
                                  width: 165,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[850],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Humidity'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/humidity.png',
                                              height: 25,
                                              width: 25,
                                            ),
                                            Text('  ${weather.humidity} %',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
  }
}