import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/widgets/card_view.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  WeatherController controller = Get.put(
    WeatherController(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(
      init: WeatherController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: controller.stateWeather != true
                ? Colors.blue
                : controller.weatherController!.getThemColor(),
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(SearchPage());
                },
                icon: const Icon(Icons.search),
              )
            ],
            title: const Text('Weather App'),
          ),
          body: controller.stateWeather != true
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'there is no weather 😔 start',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'searching now 🔍',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      controller.weatherController!.getThemColor(),
                      controller.weatherController!.getThemColor()[300]!,
                      controller.weatherController!.getThemColor()[100]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      Text(
                        controller.cityName!.value,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'updated at : ${controller.weatherController!.date.hour.toString()} : ${controller.weatherController!.date.minute.toString()}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(controller.weatherController!.getThem()!),
                          Text(
                            controller.weatherController!.temp
                                .toInt()
                                .toString(),
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                'maxTemp : ${controller.weatherController!.maxTemp.toInt().toString()}',
                              ),
                              Text(
                                'minTemp : ${controller.weatherController!.minTemp.toInt().toString()}',
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        controller.weatherController!.weatherStateName,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: controller.stateWeather == true
                  ? controller.weatherController!.getThemColor()
                  : Colors.blue,
              onPressed: () {
                Get.to(CardCircle());
              },
              child: const Icon(Icons.person)),
        );
      },
    );
  }
}
