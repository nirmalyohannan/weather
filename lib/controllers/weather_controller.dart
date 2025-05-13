import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/current_weather.dart';
import 'package:weather/services/location_service.dart';
import 'package:weather/services/weather_service.dart';

import '../database/db.dart';

class WeatherController extends ChangeNotifier {
  Position? position;
  bool currentLoading = true;
  CurrentWeather? currentWeather;

  bool isFromGPS = false;

  void init() {
    currentWeather = DB.getWeather();
    if (currentWeather == null) {
      getCurrentWeather();
    } else {
      getCurrentWeather(place: currentWeather!.location!.name!);
    }
  }

  void getCurrentWeather({String? place}) async {
    if (place == null) {
      isFromGPS = true;
    } else {
      isFromGPS = false;
    }
    CurrentWeather? previousWeather = currentWeather;
    currentLoading = true;
    await Future.delayed(const Duration(seconds: 0));
    notifyListeners();
    if (place != null) {
      currentWeather = await WeatherService.getCurrentWeather(place);
    } else {
      position = await LocationService.getPosition();

      currentWeather =
          await WeatherService.getCurrentWeather("${position!.latitude},${position!.longitude}");
    }
    currentLoading = false;
    if (currentWeather == null && previousWeather != null) {
      currentWeather = previousWeather;
    }
    DB.writeWeather(currentWeather);
    notifyListeners();
  }
}
