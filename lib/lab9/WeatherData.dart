import 'package:intl/intl.dart';

class WeatherData {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final int pressure;
  final String condition;
  final String icon;
  final double uvIndex;
  final double dewPoint;
  final double rainChance;
  final DateTime dateTime;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
    required this.condition,
    required this.icon,
    required this.uvIndex,
    required this.dewPoint,
    required this.rainChance,
    required this.dateTime,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json, String cityName) {
    return WeatherData(
      cityName: cityName,
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: json['main']['humidity'] as int,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      pressure: json['main']['pressure'] as int,
      condition: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      uvIndex: json['uvi']?.toDouble() ?? 0.0, // Chỉ số UV (nếu có)
      dewPoint:
          json['main']['dew_point']?.toDouble() ?? 0.0, // Điểm sương (nếu có)
      rainChance:
          (json['pop']?.toDouble() ?? 0.0) * 100, // Xác suất mưa (nếu có)
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
    );
  }
}

class ForecastData {
  final List<WeatherData> forecastList;

  ForecastData({required this.forecastList});

  factory ForecastData.fromJson(Map<String, dynamic> json, String cityName) {
    List<WeatherData> forecastList = [];
    for (var item in json['list']) {
      forecastList.add(WeatherData.fromJson(item, cityName));
    }
    return ForecastData(forecastList: forecastList);
  }
}
