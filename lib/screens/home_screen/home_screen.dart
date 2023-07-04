import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/controllers/weather_controller.dart';
import 'package:weather/models/current_weather.dart';
import 'package:weather/screens/home_screen/weather_bg_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.read<WeatherController>().getCurrentWeather();
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          const WeatherBgWidget(),
          Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: searchController,
                onEditingComplete: () => context.read<WeatherController>().getCurrentWeather(
                    place: searchController.text.isEmpty ? null : searchController.text),
                decoration: const InputDecoration(hintText: "Search places"),
              ),
              Consumer<WeatherController>(builder: (context, controller, child) {
                if (controller.currentLoading) {
                  return const CircularProgressIndicator();
                }
                if (controller.currentWeather == null) {
                  return const Text("Something Went Wrong!!");
                }
                CurrentWeather currentWeather = controller.currentWeather!;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(currentWeather.location!.name!),
                    Text(currentWeather.current!.tempC!.toString())
                  ],
                );
              }),
            ],
          )),
        ],
      )),
    );
  }
}
