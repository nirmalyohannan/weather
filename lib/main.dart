import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/controllers/weather_controller.dart';
import 'package:weather/screens/home_screen/home_screen.dart';
import 'package:weather/screens/widgets/ui_constants.dart';

import 'database/db.dart';

void main() async {
  await DB.init();
  runApp(const MyApp());
}

final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => WeatherController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(color: Colors.black87),
            displayLarge: TextStyle(fontWeight: FontWeight.bold),
          ),
          //----------------------------
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.black54),
            border: InputBorder.none,
            fillColor: Colors.white24,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: UIConstants.borderRadiusMed,
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            focusColor: Colors.white24,
            focusedBorder: OutlineInputBorder(
              borderRadius: UIConstants.borderRadiusMed,
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
