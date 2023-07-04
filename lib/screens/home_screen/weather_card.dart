import 'package:flutter/material.dart';

import '../../helpers/parse_time.dart';
import '../../models/current_weather.dart';
import '../widgets/ui_constants.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.currentWeather,
  });

  final CurrentWeather currentWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Colors.white24, borderRadius: UIConstants.borderRadiusMed),
      padding: UIConstants.paddingAll10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentWeather.location!.name!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              UIConstants.gapWidth10,
              Text(
                ",${currentWeather.location!.country!}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Text(
            "${currentWeather.current!.tempC!}°C",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${parseTime(currentWeather.location!.localtime!)}",
              style:
                  const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
