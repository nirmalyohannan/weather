import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/models/current_weather.dart';

class DB {
  static late Box weatherBox;
  static init() async {
    await Hive.initFlutter();
    weatherBox = await Hive.openBox("weatherBox");
  }

  static CurrentWeather? getWeather() {
    var weather = weatherBox.get('weather');
    if (weather == null) {
      return null;
    }
    log(weather.toString());
    return CurrentWeather.fromJson(weather);
  }

  static void writeWeather(CurrentWeather? currentWeather) {
    if (currentWeather == null) {
      return;
    }
    weatherBox.put('weather', currentWeather.toJson());
  }
}
