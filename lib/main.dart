import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
      theme: ThemeData.dark(),
    );
  }
}

