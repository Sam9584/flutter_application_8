import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/Models/weather_data_model.dart';
import 'package:flutter_application_8/Screens/error_screen.dart';
import 'package:flutter_application_8/Screens/loading_screen.dart';
import 'package:flutter_application_8/Screens/login_screen.dart';
import 'package:flutter_application_8/Screens/next_screen.dart';
import 'package:flutter_application_8/Screens/register_screen.dart';
import 'package:flutter_application_8/api_helper.dart';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  WeatherDataModel? weatherdatamodel;
  // String? cityName;
  // String? weatherIcon;
  // double temperature = 0;
  // int? H;
  // int? L;
  // String? weatherMessage;
  // int condition = 0;
  // String country = '';
  bool error = false;
  bool loading =
      true; // 34an el page ttl3 3ala tool mn gher ma t load el hagat mn el awel w tkon be zero
  void getWeatherData() async {
    // mmkn nktbha future<void>
    try {
      print('Loading...');
      setState(() {
        // 34an y3ml refresh ll page
        loading = true;
        error = false;
      });
      Map<String, dynamic> weatherData = await ApiHelper.GetData(
        //'https://api.openweathermap.org/data/2.5/forecast/daily?q=Egypt&cnt=7&appid=f3ddb9767600b73216545d50684b816e&units=metric'
        //'https://api.openweathermap.org/data/2.5/forecast/daily?lat=44.34&lon=10.99&cnt=7&appid=f3ddb9767600b73216545d50684b816e&units=metric'
        //"https://api.openweathermap.org/data/2.5/weather?q=Egypt&appid=f3ddb9767600b73216545d50684b816e&units=metric",
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=f3ddb9767600b73216545d50684b816e&units=metric',
        //'https://api.openweathermap.org/data/2.5/forecast/daily?lat=44.3&lon=10.99&cnt=7&appid=f3ddb9767600b73216545d50684b816e&units=metric');
        // print(
        // "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=f3ddb9767600b73216545d50684b816e&units=metric"
      );

      setState(() {
        // lw ma7ttsh fe setstate htkon b NULL
        // cityName = weatherData['name'];
        // weatherMessage = weatherData['weather'][0]['description'];
        // temperature = weatherData['main']['temp'];
        // H = weatherData['main']['temp_max'].toInt();
        // L = weatherData['main']['temp_min'].toInt();
        // condition = weatherData['weather'][0]['id'];
        // country = weatherData['sys']['country'];
        weatherdatamodel = WeatherDataModel.fromMap(
            weatherData); // from map btkon me7taga map fa broh ashof el map ely ana bageb mnaha el data bta3ty fen
        loading = false; // data et7mlt
        error = false;
      });
      print('loading successful');
      //print('temperature => ${weatherData['main']['temp']}');
    } catch (e) {
      print("error => $e");
      setState(() {
        // khalrtha hna b false 34an lw hasl haga mafish net aw location ytl3 mn el loop eno hwa yfdal fel screen el loading
        loading = false; // fashl eno y7ml el data
        error = true; // kda 34an hykon fe3lann feh error
      });
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(e.toString()),
      //     ),
      //   );
    }
  }

  String getWeatherIconPathFromCondition(int condition) {
    if (condition < 300) {
      return 'assets/images/thunderstorm_2.png';
    } else if (condition < 400) {
      return 'assets/images/sun_cloud_mid_rain.png';
    } else if (condition < 600) {
      return 'assets/images/moon_cloud_mid_rain.png';
    } else if (condition < 700) {
      return 'assets/images/heavy_snowfall.png';
    } else if (condition < 800) {
      return 'assets/images/tornado.png';
    } else if (condition == 800) {
      return 'assets/images/sunny.png';
    } else if (condition <= 804) {
      return 'assets/images/moon_cloud_fast_wind.png';
    } else {
      return 'assets/images/moon.png';
    }
  }

  String getMessageFromTemperature(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  void initState() {
    // awel ma ydkhol 3ala el page hygeb el location bta3y
    super.initState();
    //LoginScreen();
    getWeatherData();
    //getWeatherIconPathFromCondition(condition!);
  }

  @override
  Widget build(BuildContext context) {
    //ya ema hasal error fa khalet el loading be false ya ema hasal success fa khalet el loading be false
    if (loading == true) {
      return loadingScreen();
    } else {
      if (error == true) {
        return errorScreen(
          onpressed: () {
            getWeatherData();
          },
        );
      } else {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Background2.png"),
                fit: BoxFit.cover, // fit btakhod kol el mas7a el mota7a 3andy
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 65,
                ),
                Text(
                  '${weatherdatamodel!.name}',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF-Pro',
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${weatherdatamodel!.main.temp.toInt()}°',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w100,
                        fontFamily: 'SF-Pro',
                        color: Colors.white,
                      ),
                    ),
                    Image(
                      image: AssetImage(getWeatherIconPathFromCondition(
                          weatherdatamodel!.weather[0].id)),
                      width: 95,
                      height: 95,
                    ),
                  ],
                ),
                Text(
                  '${weatherdatamodel!.weather[0].description} in ${weatherdatamodel!.sys.country}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro',
                    color: Colors.white.withOpacity(0.6),

                    /// btakhly el lon baht shwya
                  ),
                ),
                Text(
                  'H:${weatherdatamodel!.main.tempMin}° L:${weatherdatamodel!.main.tempMax}°', // EL ESM . ELY HNA BYKON ELY FEL MODEL
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF-Pro',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
                Column(
                  children: [
                    Text(
                      getMessageFromTemperature(
                          weatherdatamodel!.main.temp.toInt()),
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'SF-Pro',
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                            ;
                          },
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: Text('back'),
                        ),
                        FilledButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WeatherScreen(),
                              ),
                            );
                          },
                          style: FilledButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: Text('next'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    }
  }
}


//https://api.openweathermap.org/data/2.5/weather?q=Egypt&appid=f3ddb9767600b73216545d50684b816e