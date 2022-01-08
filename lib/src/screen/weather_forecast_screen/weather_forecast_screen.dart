import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:weather_app/src/constants/app_asset.dart';
import 'package:weather_app/src/constants/app_colors.dart';
import 'package:weather_app/src/constants/app_string.dart';
import 'package:weather_app/src/constants/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WeatherForecastScreen extends StatefulWidget {
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final controller = MapController(
    location: LatLng(67.8424, 97.6465),
  );

  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  final AppTheme _theme = AppTheme();

  double heightOfLeadingLogoAppBar = 48;

  double widthOfLeadingLogoAppBar = 50;

  double heightOfActionLogoAppBar = 30;

  double widthOfActionLogoAppBar = 30;

  @override
  Widget build(BuildContext context) {
    TextStyle titleAppBarStyle = _theme.lightTheme.textTheme.bodyText2!
        .copyWith(
            fontFamily: AppFont.fontLight, fontSize: 18, color: Colors.white);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backgroundColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 28),
          child: SizedBox(
              height: heightOfLeadingLogoAppBar,
              width: widthOfLeadingLogoAppBar,
              child: Image.asset(AppAsset.logoCloud)),
        ),
        centerTitle: true,
        title: Text(
          AppString.weatherForecast,
          style: titleAppBarStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 28),
            child: SizedBox(
                height: heightOfActionLogoAppBar,
                width: widthOfActionLogoAppBar,
                child: Image.asset(AppAsset.logoSetting)),
          ),
        ],
      ),
      body: Container(
          height: 400,
          child: Map(
            controller: controller,
            builder: (BuildContext context, int x, int y, int z) {
              return Image.network(
                'https://tile.openweathermap.org/map/temp_new/3/$x/$y.png?appid=3bc79b2a9f4b2f0a5a9ade0aa53f32f3',
                fit: BoxFit.cover,
              );
            },
          )),
    );
  }
}
