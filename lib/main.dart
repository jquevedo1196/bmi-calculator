import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/first': (context) => InputPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => ResultsPage(),
      },
    );
  }
}
