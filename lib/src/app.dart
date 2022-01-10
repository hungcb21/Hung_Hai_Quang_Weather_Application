import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/blocs/location/location_bloc.dart';
import 'package:weather_app/src/constants/routes_name.dart';
import 'package:weather_app/src/routes/route_controller.dart';
import 'package:weather_app/src/services/location/location_impl.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc(service: LocationImpl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.location,
        onGenerateRoute: RouteController().routePage,
      ),
    );
  }
}
