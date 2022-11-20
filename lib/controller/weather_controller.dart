import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherController extends GetxController {
  WeatherModel? _weatherController;
  RxString? cityName = ''.obs;
  bool? stateWeather;
  bool? stateConnect;

  set weatherController(WeatherModel? weather) {
    _weatherController = weather;
  }

  // ignore: unnecessary_getters_setters
  WeatherModel? get weatherController => _weatherController;

  void check(WeatherModel? weather) {
    if (weather != null) {
      stateWeather = true;
    } else {
      stateWeather = false;
    }
    update();
  }

  void connectInternet() async {
    final result = await Connectivity().checkConnectivity();

    result != ConnectivityResult.none
        ? stateConnect = true
        : stateConnect = false;
    update();
  }
}
