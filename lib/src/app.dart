import 'package:flutter/material.dart';
import 'package:weather_app/src/screen/location_screen/location_screen.dart';
import 'package:weather_app/src/screen/main_screen/main_screen.dart';
import 'package:weather_app/src/screen/weather_forecast_screen/weather_forecast_screen.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:WeatherForecastScreen(),
    );
  }
}