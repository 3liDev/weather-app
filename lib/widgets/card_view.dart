import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';

// ignore: use_key_in_widget_constructors
class CardCircle extends StatelessWidget {
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
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  controller.stateWeather == true
                      ? controller.weatherController!.getThemColor()
                      : Colors.blue,
                  controller.stateWeather == true
                      ? controller.weatherController!.getThemColor()[300]!
                      : Colors.blue[300]!,
                  controller.stateWeather == true
                      ? controller.weatherController!.getThemColor()[100]!
                      : Colors.blue[100]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: controller.stateWeather != true
                        ? Colors.white
                        : controller.weatherController!.getThemColor(),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          controller.stateWeather == true
                              ? controller.weatherController!.getThem()!
                              : 'assets/images/clear.png'),
                      backgroundColor: controller.stateWeather == true
                          ? controller.weatherController!.getThemColor()[300]!
                          : Colors.blue[300]!,
                    ),
                  ),
                  const Text(
                    "Ali Joher",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const Text(
                    "Computer Engineer\n  Flutter Developer",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: Colors.black54,
                    thickness: 1,
                    indent: 60,
                    endIndent: 60,
                    height: 5,
                  ),
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: controller.stateWeather == true
                        ? controller.weatherController!.getThemColor()[300]!
                        : Colors.blue[400]!,
                    child: const ListTile(
                      leading: Icon(
                        Icons.phone,
                        size: 30,
                        color: Colors.black,
                      ),
                      title: Text(
                        "(+963) 938943188",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: controller.stateWeather == true
                        ? controller.weatherController!.getThemColor()[300]!
                        : Colors.blue[400]!,
                    child: const ListTile(
                      leading: Icon(
                        Icons.mail,
                        size: 30,
                        color: Colors.black,
                      ),
                      title: Text(
                        "ali18869@gmail.com",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
