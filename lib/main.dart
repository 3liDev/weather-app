import 'package:flutter/material.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(WeatherApp());
}

// ignore: must_be_immutable, use_key_in_widget_constructors
class WeatherApp extends StatelessWidget {
  WeatherController controller = Get.put(WeatherController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: controller.stateWeather != true ? Colors.blue
      //       : controller.weatherController!.getThemColor(),
      // ),

      home: HomePage(),
    );
  }
}
