class Config {
  static final Config _instance = Config._internal();

  String apiKey = 'dea21a955fc641cca42111716242704';
  String baseUrl = 'https://api.weatherapi.com/v1';
  String currentWeather = 'current.json';

  Config._internal();

  factory Config() => _instance;
}
