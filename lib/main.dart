import 'package:flutter/material.dart';
import 'package:weather/Weather.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/a" : (BuildContext context) => nextScreen()
      },
      home: HomePage(),
    );
  }
}