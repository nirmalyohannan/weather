import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/main.dart';
import 'package:weather/models/current_weather.dart';

import '../config/api_endpoints.dart';
import '../config/credentials.dart';

class WeatherService {
  static Future<CurrentWeather?> getCurrentWeather(String query) async {
    try {
      String path =
          "${ApiEndpoints.baseUrl}${ApiEndpoints.currentWeather}?key=${Credentials.apiKey}&q=$query";
      log(path);
      http.Response response = await http.get(Uri.parse(path));

      if (response.statusCode == 200) {
        CurrentWeather currentWeather =
            CurrentWeather.fromJson(jsonDecode(response.body));
        return currentWeather;
      } else {
        log("Something Wrong");
        return null;
      }
    } catch (e) {
      log(e.toString());
      switch (e.toString()) {
        case "Failed host lookup: 'api.weatherapi.com'":
          scaffoldKey.currentState!.showSnackBar(const SnackBar(
            content: Text("Check Internet connectivity!"),
          ));
          break;
        default:
          scaffoldKey.currentState!
              .showSnackBar(SnackBar(content: Text(e.toString())));
      }
      return null;
    }
  }
}
