// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weather_app/location.dart';
import 'package:weather_app/screens/locaton_screen.dart';
import 'package:weather_app/servics/Weather.dart';

import '../servics/api.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

@override
class _MainState extends State<Main> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetLocation();
  }

  WeatherModel weatherModel = WeatherModel();
  void GetLocation() async {
    var WeatherData = await weatherModel.getlocation();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Screen(locatonWeather: WeatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.teal,
          size: 50,
        ),
      ),
    );
  }
}
