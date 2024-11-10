import 'package:flutter/material.dart';
import 'package:flutter_application_8/Models/weather_data_model.dart';
import 'package:flutter_application_8/Screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final List<String> countries = [
    "London",
    "Paris",
    "Tokyo",
    "New York",
    "Berlin",
    "Sydney",
    "Moscow",
    "Dubai"
  ];
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState

    super.setState(fn);
  }

  final String apiKey = 'f3ddb9767600b73216545d50684b816e';

  Future<List<Map<String, dynamic>>> fetchWeatherData() async {
    List<Map<String, dynamic>> weatherData = [];

    for (String country in countries) {
      final url = Uri.parse(
        //https://api.openweathermap.org/data/2.5/weather?q=Berlin&appid=f3ddb9767600b73216545d50684b816e&units=metric
        'https://api.openweathermap.org/data/2.5/weather?q=$country&appid=$apiKey&units=metric',
      );

      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final temperature = data['main']['temp'];
        final weatherCondition = data['weather'][0]['main'];

        weatherData.add({
          "country": country,
          "temperature": temperature,
          "condition": weatherCondition,
        });
      } else {
        throw Exception("Failed to load weather data for $country");
      }
    }
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 52, 66),
      appBar: AppBar(
        title: Text("Country Temperatures"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchWeatherData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else {
                  final weatherData = snapshot.data!;
                  return ListView.builder(
                    itemCount: weatherData.length,
                    itemBuilder: (context, index) {
                      final countryData = weatherData[index];
                      return WeatherCard(
                        country: countryData["country"],
                        temperature: countryData["temperature"],
                        condition: countryData["condition"],
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomFilledButton(
              text: 'Get back',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => homeScreen(),
                  ),
                );
              },
              backgroundColor: Colors.black,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String country;
  final double temperature;
  final String condition;

  WeatherCard({
    required this.country,
    required this.temperature,
    required this.condition,
  });

  IconData getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return Icons.wb_sunny;
      case 'clouds':
        return Icons.cloud;
      case 'rain':
        return Icons.grain;
      case 'snow':
        return Icons.ac_unit;
      case 'thunderstorm':
        return Icons.flash_on;
      default:
        return Icons.wb_cloudy;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "$temperature°C",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  condition,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Icon(
              getWeatherIcon(condition),
              size: 50,
              color: const Color.fromARGB(255, 47, 70, 110),
            ),
          ],
        ),
      ),
    );
  }
}

// cutsom filled button
class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomFilledButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(backgroundColor: backgroundColor),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
