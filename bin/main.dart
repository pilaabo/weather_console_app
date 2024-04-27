import 'package:weather_console_app/weather_api_client.dart';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('Syntax error: dart bin/main.dart <city>');
    return;
  }
  final cityName = args.first;
  final weatherApiClient = WeatherApiClient();
  final currentWeather = await weatherApiClient.getCurrentWeather(cityName);
  print(currentWeather.tempC);
}
