import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/controllers/weather_controller.dart';
import 'package:weather/main.dart';
import 'package:weather/models/current_weather.dart';
import 'package:weather/screens/home_screen/weather_bg_widget.dart';
import 'package:weather/screens/home_screen/weather_card.dart';
import 'package:weather/screens/home_screen/weather_card_sec.dart';
import 'package:weather/screens/widgets/ui_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherController>().init();
    return ScaffoldMessenger(
      key: scaffoldKey,
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          alignment: Alignment.center,
          children: [
            const WeatherBgWidget(),
            Padding(
              padding: UIConstants.paddingAll10,
              child: Column(
                children: [
                  _SearchWidget(),
                  UIConstants.gapHeight20,
                  Consumer<WeatherController>(builder: (context, controller, child) {
                    if (controller.currentLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (controller.currentWeather == null) {
                      return const _WeatherErrorWidget();
                    }
                    CurrentWeather currentWeather = controller.currentWeather!;
                    return Column(
                      children: [
                        WeatherCard(currentWeather: currentWeather),
                        UIConstants.gapHeight20,
                        WeatherCardSec(currentWeather: currentWeather)
                      ],
                    );
                  }),
                ],
              ),
            ),
            const FloatingButton()
          ],
        )),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return context.watch<WeatherController>().isFromGPS
        ? const SizedBox()
        : Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: UIConstants.paddingAll20,
              child: FloatingActionButton(
                onPressed: () => context.read<WeatherController>().getCurrentWeather(),
                child: const Icon(Icons.gps_fixed),
              ),
            ),
          );
  }
}

class _WeatherErrorWidget extends StatelessWidget {
  const _WeatherErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Something Went Wrong!!"),
          UIConstants.gapHeight20,
          UIConstants.gapHeight20,
          OutlinedButton(
              onPressed: () => context.read<WeatherController>().getCurrentWeather(),
              child: const Icon(
                Icons.refresh,
                size: 55,
              )),
        ],
      ),
    );
  }
}

class _SearchWidget extends StatelessWidget {
  _SearchWidget();

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onEditingComplete: () {
        context
            .read<WeatherController>()
            .getCurrentWeather(place: searchController.text.isEmpty ? null : searchController.text);
        FocusScope.of(context).unfocus();
      },
      decoration: const InputDecoration(hintText: "Search places"),
    );
  }
}
