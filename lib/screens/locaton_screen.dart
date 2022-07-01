

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/servics/Weather.dart';

class Screen extends StatefulWidget {
  Screen({this.locatonWeather});
  final locatonWeather;

  @override
  State<Screen> createState() => _ScreenState();
}

int? tempe;
String? weatherIcon;
String? cityName;
String? weatherMessage;
WeatherModel weatherModel = WeatherModel();

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ui(widget.locatonWeather);
    // print(widget.locatonWeather);
  }

  void ui(dynamic Weather) {
    setState(() {
      if (Weather == null) {
        tempe = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      var weatherData = widget.locatonWeather;
      double temp = widget.locatonWeather["main"]["temp"];
      tempe = temp.toInt();

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherMessage = weatherModel.getMessage(tempe!);
      cityName = weatherData['name'];
    });
    // double temp = widget.locatonWeather["main"]["temp"];
    // tempe = temp.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/location_background.jpg"),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
              child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      actions: [
                        FlatButton(
                          onPressed: () async {
                            var typename = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => City()));
                            if (typename != null) {
                              var weatherData =
                               // await 
                                 weatherModel.GetCityWeather(typename);
                              //   Screen(locatonWeather: weatherData);
                              ui(weatherData);
                            }
                          },
                          child: Icon(
                            Icons.settings,
                            size: 40,
                          ),
                        )
                      ],
                      backgroundColor: Colors.transparent,
                      leading: FlatButton(
                        onPressed: () async {
                          var weatherData = await weatherModel.getlocation();
                          ui(weatherData);
                        },
                        child: Icon(
                          Icons.telegram,
                          size: 40,
                        ),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                  )

                  // Container(color: Colors.transparent,
                  ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // '$weatherMessage in $cityName',
                      "$tempe  $weatherIcon",
                      //     weatherModel.getWeatherIcon(
                      //         widget.locatonWeather["weather"][0]["id"]),
                      style: ktext,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Text(
                    '$weatherMessage in $cityName',
                    // weatherModel.getMessage(tempe!) +
                    //     " in " +
                    //     widget.locatonWeather["name"],
                    style: ktext,
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
