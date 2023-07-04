import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/controllers/weather_controller.dart';

import '../../config/assets.dart';

class WeatherBgWidget extends StatelessWidget {
  const WeatherBgWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(
        builder: (context, controller, child) => AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: controller.currentLoading == true ? 0 : 1,
              child: Builder(builder: (context) {
                if (controller.currentWeather == null) {
                  return const SizedBox();
                }
                Size size = MediaQuery.of(context).size;
                num tempC = controller.currentWeather!.current!.tempC!;
                bool isRaning = controller.currentWeather!.current!.cloud! > 90 ? true : false;
                return Stack(
                  children: [
                    Builder(builder: (context) {
                      if (tempC < 3) {
                        return Stack(
                          children: [
                            Image.asset(
                              Assets.weatherBgSnow,
                              width: size.width,
                              height: size.height,
                              fit: BoxFit.cover,
                            ),
                            Lottie.asset(Assets.lottieSnow,
                                width: size.width, height: size.height, fit: BoxFit.cover)
                          ],
                        );
                      } else if (tempC < 18) {
                        return Image.asset(
                          Assets.weatherBgFoggy,
                          width: size.width,
                          height: size.height,
                          fit: BoxFit.cover,
                        );
                      } else if (tempC < 26) {
                        return Image.asset(
                          Assets.weatherBgModerate,
                          width: size.width,
                          height: size.height,
                          fit: BoxFit.cover,
                        );
                      } else if (tempC < 30) {
                        return Image.asset(
                          Assets.weatherBgSummer,
                          width: size.width,
                          height: size.height,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Image.asset(
                          Assets.weatherBgDesert,
                          width: size.width,
                          height: size.height,
                          fit: BoxFit.cover,
                        );
                      }
                    }),
                    Visibility(
                        visible: isRaning,
                        child: Lottie.asset(
                          Assets.lottieRain,
                          width: size.width,
                          height: size.height,
                          fit: BoxFit.cover,
                        ))
                  ],
                );
              }),
            ));
  }
}
