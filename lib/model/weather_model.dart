import 'package:flutter/material.dart';

class WeatherModel {
  String weatherStateName;
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  WeatherModel({
    required this.weatherStateName,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
        weatherStateName: data['weather_state_name'],
        date: DateTime.parse(data['created']),
        temp: data['the_temp'],
        minTemp: data['min_temp'],
        maxTemp: data['max_temp']);
  }
  String? getThem() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain' ||
        weatherStateName == 'Showers') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm') {
      return Colors.yellow;
    } else {
      return Colors.blue;
    }
  }

  // Color getColor() {
  //   if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
  //     return Colors.orange;
  //   } else if (weatherStateName == 'Sleet' ||
  //       weatherStateName == 'Snow' ||
  //       weatherStateName == 'Hail') {
  //     return Colors.blue;
  //   } else if (weatherStateName == 'Heavy Cloud') {
  //     return Colors.blueGrey;
  //   } else if (weatherStateName == 'Heavy Rain' ||
  //       weatherStateName == 'Light Rain' ||
  //       weatherStateName == 'Showers') {
  //     return Colors.blue;
  //   } else if (weatherStateName == 'Thunderstorm') {
  //     return Colors.yellow;
  //   } else {
  //     return Colors.blue;
  //   }
  // }
}
