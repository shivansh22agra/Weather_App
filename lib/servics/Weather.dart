import 'dart:convert';

import 'package:weather_app/location.dart';
import 'package:weather_app/servics/api.dart';

String api = "https://api.openweathermap.org/data/2.5/weather";
const apikey = "42fd844028b7613e92d09c0ea33018ef";

class WeatherModel {
  Future<void> GetCityWeather(String cityName)async {
    var url = '$api?q=$cityName&appid=$apikey&units-metric';
    Network network = Network(url: url);
    var weatherData = await network.GetData();
    return weatherData;

  }

  Future<dynamic> getlocation() async {
    Location location = Location();
    await location.GetCurrentLocation();

    Network network = Network(
        url:
            "$api?lat=${location.latitude}&lon=${location.longitute}&appid=$apikey&units=metric");
    var weatherData = await network.GetData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
