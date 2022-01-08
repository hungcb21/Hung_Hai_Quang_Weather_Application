import 'package:flutter/material.dart';
import 'package:weather_app/src/constants/app_colors.dart';
import 'package:weather_app/src/constants/app_string.dart';
import 'package:weather_app/src/constants/app_theme.dart';

class LocationScreen extends StatelessWidget {
  final AppTheme _theme = AppTheme();

  @override
  Widget build(BuildContext context) {
    TextStyle leadingAppBar = _theme.lightTheme.textTheme.bodyText2!.copyWith(
        fontFamily: AppFont.fontLight, color: Color(0xff54C9F9), fontSize: 20);
    TextStyle titleAppBar = _theme.lightTheme.textTheme.bodyText2!.copyWith(
        fontFamily: AppFont.fontLight, color: Color(0xffffffff), fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backgroundColor,
        leadingWidth: 100,
        leading: Padding(
          padding: EdgeInsets.only(left: 28,right: 0),
          child: Center(
            child: Text(
              AppString.done,
              style: leadingAppBar,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(AppString.location +'\n'+"Urtrecht",style: titleAppBar,),
      ),
      body: Container(
        color: ColorsApp.backgroundColor,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
