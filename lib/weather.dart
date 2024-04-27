class Weather {
  final String lastUpdated;
  final String cityName;
  final double tempC;
  final double feelsLikeC;
  final String condition;

  Weather({
    required this.lastUpdated,
    required this.cityName,
    required this.tempC,
    required this.feelsLikeC,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final currentData = json['current'];
    return Weather(
      lastUpdated: currentData['last_updated'],
      cityName: json['location']['name'],
      tempC: currentData['temp_c'].toDouble(),
      feelsLikeC: currentData['feelslike_c'].toDouble(),
      condition: currentData['condition']['text'],
    );
  }

  @override
  String toString() => '''
    Last updated: $lastUpdated
    Temperature: $tempC°C
    Feels like: $feelsLikeC°C
    City: $cityName
    Condition: $condition
  ''';
}
