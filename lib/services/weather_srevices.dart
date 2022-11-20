import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  String baseUrl = 'https://www.metaweather.com';
  Future<int> getCityId({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/api/location/search/?query=$cityName');
    http.Response responce = await http.get(url);

    List<dynamic> data = jsonDecode(responce.body);

    int cityId = data[0]["woeid"];
    return cityId;
  }

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      int id = await getCityId(cityName: cityName);
      Uri url = Uri.parse('$baseUrl/api/location/$id/');
      http.Response responce = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(responce.body);
      Map<String, dynamic> data = jsonData['consolidated_weather'][0];
      weatherData = WeatherModel.fromJson(data);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return weatherData;
  }
}
