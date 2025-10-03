import 'package:flutter/material.dart';

class PcosdashboardController with ChangeNotifier {
  // Fasting Glucose / HbA1c
  final data = [
    [80.0, 30.0], // Mon (Fasting, HbA1c)
    [75.0, 25.0], // Tue
    [75.0, 25.0], // Wed
    [75.0, 25.0], // Thu
    [80.0, 30.0], // Fri
    [78.0, 28.0], // Sat
    [78.0, 28.0], // Sun
  ];
}
