import 'package:weather_app/src/models/city.dart';

abstract class LocationService {
  LocationService();

  Future<List<City>> fetchCity();
}
