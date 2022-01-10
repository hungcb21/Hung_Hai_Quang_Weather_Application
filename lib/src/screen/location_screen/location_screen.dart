import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_string.dart';
import './widget/location_search.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
        backgroundColor: ColorsApp.primaryBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorsApp.primaryBackgroundColor,
          leading: TextButton(
            child: Text(
              AppString.done,
              style: _theme.textTheme.bodyText2!.copyWith(
                  fontSize: 17.5,
                  fontWeight: FontWeight.w300,
                  color: ColorsApp.leadingTextColor),
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                AppString.location,
                style: _theme.textTheme.bodyText1!
                    .copyWith(fontSize: 18, color: Colors.white),
              ),
              Text(
                'Utrecht',
                style: _theme.textTheme.bodyText1!.copyWith(
                    color: ColorsApp.secondaryTextColor, fontSize: 18),
              )
            ],
          ),
        ),
        body: LocationSearch());
  }
}
