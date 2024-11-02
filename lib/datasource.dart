import 'dart:convert';

import 'package:weather_app/models/weather_data_model.dart';
import 'package:http/http.dart' as http;

class DataSource {
  String appId = ""; //Put App id from OpenWeather API here;

  Future<WeatherDataModel> getWeatherData(String cityName) async {
    final String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$appId";
    try {
      final response = await http.get(Uri.parse(url));
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json["cod"] == 200) {
        return WeatherDataModel.fromJson(json);
      } else {
        throw Exception(json["message"]);
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
