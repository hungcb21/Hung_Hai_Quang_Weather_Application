import 'package:flutter/material.dart';
import 'package:weather_app/src/constants/routes_name.dart';
import 'package:weather_app/src/screen/main_screen/main_screen.dart';
import 'package:weather_app/src/screen/not_found_screen/not_found_screen.dart';

class RouteController {
  MaterialPageRoute routePage(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) {
        switch (settings.name) {
          case RouteNames.main:
            return MainScreen();
          default:
            return NotFoundScreen();
        }
      },
      settings: settings,
    );
  }
}