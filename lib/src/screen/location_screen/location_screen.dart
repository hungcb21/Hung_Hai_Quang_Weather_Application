import 'package:flutter/material.dart';
import 'package:weather_app/src/constants/app_colors.dart';
import 'package:weather_app/src/screen/location_screen/widget/location_search.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
        backgroundColor: ColorsApp.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsApp.primaryColor,
          leading: TextButton(
            child: Text(
              'Done',
              style: _theme.textTheme.bodyText2!.copyWith(color: Colors.blue),
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                'Location',
                style:
                    _theme.textTheme.subtitle1!.copyWith(color: Colors.white70),
              ),
              Text(
                'Utrecht',
                style: _theme.textTheme.subtitle2!.copyWith(
                    color: Colors.white38, fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        body: LocationSearch());
  }
}
