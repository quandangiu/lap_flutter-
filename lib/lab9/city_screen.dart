import 'package:flutter/material.dart';
import 'package:lab_flutter/lab9/weather_service.dart';
import 'weather_screen.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final TextEditingController _cityController = TextEditingController();
  bool _isLoading = false;

  void searchCityWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String cityName = _cityController.text.trim();
      if (cityName.isEmpty) {
        throw Exception('Vui lòng nhập tên thành phố.');
      }

      var weatherData = await WeatherService().getWeatherByCity(cityName);
      var forecastData = await WeatherService().getForecastByCity(cityName);

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
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tìm kiếm thành phố')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Nhập tên thành phố',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: (_) => searchCityWeather(),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: searchCityWeather,
                  child: const Text('Tìm kiếm'),
                ),
          ],
        ),
      ),
    );
  }
}
