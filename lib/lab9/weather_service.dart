import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lab_flutter/lab9/WeatherData.dart';

class WeatherService {
  static const String apiKey = '8a10d3e279c8b3e91ae35564f64a3ff8';
  static const String weatherUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  static const String forecastUrl =
      'https://api.openweathermap.org/data/2.5/forecast';

  // Lấy dữ liệu thời tiết hiện tại theo vị trí
  Future<WeatherData> getWeatherByLocation(double lat, double lon) async {
    final url =
        '$weatherUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=vi';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return WeatherData.fromJson(jsonData, jsonData['name']);
      } else {
        throw Exception(
          'Không thể lấy dữ liệu thời tiết. Mã lỗi: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Lỗi kết nối hoặc dữ liệu không hợp lệ: $e');
    }
  }

  // Lấy dữ liệu thời tiết hiện tại theo tên thành phố
  Future<WeatherData> getWeatherByCity(String cityName) async {
    final url = '$weatherUrl?q=$cityName&appid=$apiKey&units=metric&lang=vi';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return WeatherData.fromJson(jsonData, cityName);
      } else {
        throw Exception(
          'Không thể lấy dữ liệu thời tiết. Mã lỗi: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Lỗi kết nối hoặc dữ liệu không hợp lệ: $e');
    }
  }

  // Lấy dự báo thời tiết 5 ngày (40 khung giờ)
  Future<ForecastData> getForecastByLocation(double lat, double lon) async {
    final url =
        '$forecastUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=vi';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return ForecastData.fromJson(jsonData, jsonData['city']['name']);
      } else {
        throw Exception(
          'Không thể lấy dự báo thời tiết. Mã lỗi: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Lỗi kết nối hoặc dữ liệu không hợp lệ: $e');
    }
  }

  // Lấy dự báo thời tiết 5 ngày theo tên thành phố
  Future<ForecastData> getForecastByCity(String cityName) async {
    final url = '$forecastUrl?q=$cityName&appid=$apiKey&units=metric&lang=vi';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return ForecastData.fromJson(jsonData, cityName);
      } else {
        throw Exception(
          'Không thể lấy dự báo thời tiết. Mã lỗi: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Lỗi kết nối hoặc dữ liệu không hợp lệ: $e');
    }
  }
}
