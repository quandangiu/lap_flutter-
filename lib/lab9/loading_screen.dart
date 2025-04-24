import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lab_flutter/lab9/location_service.dart';
import 'package:lab_flutter/lab9/weather_screen.dart';
import 'package:lab_flutter/lab9/weather_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationAndWeather();
  }

  void getLocationAndWeather() async {
    try {
      var location = await LocationService().getCurrentLocation();
      double latitude = location['latitude']!;
      double longitude = location['longitude']!;

      var weatherData = await WeatherService().getWeatherByLocation(
        latitude,
        longitude,
      );
      var forecastData = await WeatherService().getForecastByLocation(
        latitude,
        longitude,
      );

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (context) => WeatherScreen(
                  weatherData: weatherData,
                  forecastData: forecastData,
                ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SpinKitDoubleBounce(color: Colors.white, size: 50.0)),
    );
  }
}
