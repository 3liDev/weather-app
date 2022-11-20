import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_srevices.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class SearchPage extends StatelessWidget {
  // WeatherController controller = Get.put(
  //   WeatherController(),
  //   permanent: true,
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a city"),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GetBuilder<WeatherController>(
                init: WeatherController(),
                builder: (controller) {
                  return TextField(
                    onChanged: (data) {
                      controller.cityName!.value = data;
                    },
                    onSubmitted: (data) async {
                      controller.cityName!.value = data;
                      WeatherServices service = WeatherServices();
                     
                      controller.connectInternet();
                      if (controller.stateConnect == true) {
                      WeatherModel? weather = await service.getWeather(
                      cityName: controller.cityName!.value);
                      controller.check(weather);
                      controller.weatherController = weather;
                        weather != null
                            ? Get.back()
                            : Get.defaultDialog(
                                title: "error",
                                middleText:
                                    "${controller.cityName} is wrong...try again");
                      } else {
                        Get.defaultDialog(
                            title: "error",
                            middleText: "No internet connection");
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        label: const Text("search"),
                        suffixIcon: GestureDetector(
                            onTap: () async {
                              WeatherServices service = WeatherServices();
                             
                              controller.connectInternet();
                              if (controller.stateConnect == true) {
                              WeatherModel? weather = await service.getWeather(
                              cityName: controller.cityName!.value);
                              controller.check(weather);
                              controller.weatherController = weather;
                                weather != null
                                    ? Get.back()
                                    : Get.defaultDialog(
                                        title: "error",
                                        middleText:
                                            "${controller.cityName} is wrong...try again");
                              } else {
                                Get.defaultDialog(
                                    title: "error",
                                    middleText: "No internet connection");
                              }
                            },
                            child: const Icon(Icons.search)),
                        border: const OutlineInputBorder(),
                        hintText: "Enter a city"),
                  );
                })),
      ),
    );
  }
}
