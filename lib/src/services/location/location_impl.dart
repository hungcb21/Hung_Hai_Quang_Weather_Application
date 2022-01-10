import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:weather_app/src/models/city.dart';
import 'package:weather_app/src/services/location/location_service.dart';

class LocationImpl extends LocationService {
  @override
  Future<List<City>> fetchCity() async {
    final jsondata = await rootBundle.loadString('asset/data/city_list.json');
    final list = json.decode(jsondata) as List<dynamic>;
    var cities = list.map((e) => City.fromJson(e)).toList();
    print('oke');
    return cities;
  }
}
