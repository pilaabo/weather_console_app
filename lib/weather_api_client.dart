import 'dart:convert';

import 'package:weather_console_app/config.dart';
import 'package:weather_console_app/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  Future<Weather> getCurrentWeather(String cityName) async {
    final url =
        '${Config().baseUrl}/${Config().currentWeather}?key=${Config().apiKey}&q=$cityName';
    print(url);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      print('Request failed with status ${response.statusCode}');
    }
    final Map<String, dynamic> jsonResponse =
        Map.castFrom(jsonDecode(response.body));
    if (jsonResponse.isEmpty) {
      print('Weather data for $cityName not found');
    }
    return Weather.fromJson(jsonResponse);
  }
}
