import 'package:flutter/material.dart';

import '../../models/current_weather.dart';
import '../widgets/ui_constants.dart';

class WeatherCardSec extends StatelessWidget {
  const WeatherCardSec({
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _VerticalSection(
              title: "Wind",
              value: "${currentWeather.current!.windKph} Mph",
            ),
            const _VertDivider(),
            _VerticalSection(
              title: "Pressure",
              value: "${currentWeather.current!.pressureIn} In",
            ),
            const _VertDivider(),
            _VerticalSection(
              title: "Humidity",
              value: "${currentWeather.current!.humidity}",
            )
          ],
        ));
  }
}

class _VertDivider extends StatelessWidget {
  const _VertDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: 30,
      color: Colors.white,
    );
  }
}

class _VerticalSection extends StatelessWidget {
  const _VerticalSection({required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(value)
      ],
    );
  }
}
