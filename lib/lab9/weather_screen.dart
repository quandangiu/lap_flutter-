import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab_flutter/lab9/WeatherData.dart';
import 'package:lab_flutter/lab9/city_screen.dart';
import 'package:lab_flutter/lab9/loading_screen.dart';

class WeatherScreen extends StatelessWidget {
  final WeatherData weatherData;
  final ForecastData forecastData;

  const WeatherScreen({
    super.key,
    required this.weatherData,
    required this.forecastData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    weatherData.cityName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CityScreen(),
                        ),
                      );
                      if (cityName != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoadingScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blueAccent, Colors.purpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            'http://openweathermap.org/img/wn/${weatherData.icon}@2x.png',
                            width: 100,
                            height: 100,
                          ),
                          Text(
                            '${weatherData.temperature.toStringAsFixed(1)}°C',
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            weatherData.condition,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text('Nhiệt độ cảm nhận'),
                                  Text(
                                    '${weatherData.feelsLike.toStringAsFixed(1)}°C',
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('Độ ẩm'),
                                  Text('${weatherData.humidity}%'),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('Tốc độ gió'),
                                  Text('${weatherData.windSpeed} m/s'),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text('Áp suất'),
                                  Text('${weatherData.pressure} hPa'),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('Chỉ số UV'),
                                  Text(
                                    '${weatherData.uvIndex.toStringAsFixed(1)}',
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('Xác suất mưa'),
                                  Text(
                                    '${weatherData.rainChance.toStringAsFixed(1)}%',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Dự báo 5 ngày',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: forecastData.forecastList.length,
                        itemBuilder: (context, index) {
                          final forecast = forecastData.forecastList[index];
                          return Container(
                            width: 120,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  DateFormat(
                                    'dd/MM HH:mm',
                                  ).format(forecast.dateTime),
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Image.network(
                                  'http://openweathermap.org/img/wn/${forecast.icon}.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Text(
                                  '${forecast.temperature.toStringAsFixed(1)}°C',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  forecast.condition,
                                  style: const TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
