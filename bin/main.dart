import 'dart:io';

import 'package:weather_console_app/weather_api_client.dart';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('Syntax error: dart bin/main.dart <city>');
    return;
  }
  final cityName = args.first;
  final weatherApiClient = WeatherApiClient();
  // Получение текущей погоды
  try {
    final currentWeather = await weatherApiClient.getCurrentWeather(cityName);
    print('Current weather for $cityName:');
    print(currentWeather);
  } on WeatherApiException catch (e) {
    print('Something went wrong on the weather server. ${e.message}');
  } on SocketException catch (e) {
    print(
        'Could not catch the current weather data. Check your Internet connection');
  } catch (e) {
    print(e);
  }
}
