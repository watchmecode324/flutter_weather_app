import 'package:flutter/material.dart';
import 'package:weather_app/datasource.dart';
import 'package:weather_app/models/weather_data_model.dart';

class WeatherDataProvider extends ChangeNotifier {
  WeatherDataModel? _weatherDataModel;

  WeatherDataModel? get weatherInfo => _weatherDataModel;

  Future<void> fetchData(String cityName) async {
    _weatherDataModel = await DataSource().getWeatherData(cityName);
    notifyListeners();
  }
}
