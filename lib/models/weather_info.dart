class WeatherInfo {
  late final double temperature;

  WeatherInfo({required this.temperature});

  WeatherInfo.fromJson(Map json) {
    temperature = json["main"]["temp"] ?? 0;
  }
}
