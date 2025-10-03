import 'package:flutter/material.dart';

class AlcoholicFattyliverController with ChangeNotifier {
  // Fasting Glucose / HbA1c
  final data = [
    [00.0, 80.0], // Mon (Fasting, HbA1c)
    [50.0, 20.0], // Tue
    [50.0, 20.0], // Wed
    [50.0, 20.0], // Thu
    [50.0, 20.0], // Fri
    [50.0, 20.0], // Sat
    [50.0, 20.0], // Sun
  ];
  bool isExpanded = false; //alcohol consumption
  String? selectedoptions;

  final List<String> alcoholoptions = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
  ];
}
