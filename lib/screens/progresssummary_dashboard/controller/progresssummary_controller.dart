import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phase3_screens/helpers/appcolors.dart';

class ProgresssummaryController with ChangeNotifier {
  String selectedOption = "Daily"; // default selected option

  final List<String> options = ["Daily", "Weekly", "Biweekly", "Monthly"];

  List<Map<String, dynamic>> Lifestylelist = [
    {
      "statusicon": Icons.check_circle,
      "status": "Normal",
      "title": "Fasting Blood Sugar",
      "value": "90",
      "unit": "mg/dL",
      "statusColor": AppColors.green,
      "cardColor": AppColors.greencontainer,
    },
    {
      "statusicon": Icons.warning,
      "status": "Moderate",
      "title": "Cholesterol",
      "value": "90",
      "unit": "mg/dL",
      "statusColor": AppColors.orange,
      "cardColor": AppColors.orangecontainer,
    },
    {
      "statusicon": Icons.error,
      "status": "High",
      "title": "Systolic / Diastolic BP",
      "value": "180/105",
      "unit": "mmHg",
      "statusColor": AppColors.red,
      "cardColor": AppColors.redcontainer,
    },
  ];
  final dataMap = <String, double>{
    "Workout : 1": 1,
    "Other 1": 1,
    "Other 2": 1,
    "Other 3": 1,
    "Other 4": 1,
  };
  final colorList = <Color>[
    AppColors.yogacolor,
    AppColors.runningcolor,
    AppColors.grey,
    AppColors.workoutcolor,
    AppColors.green,
  ];

  List<Map<String, dynamic>> exerciselist = [
    {"subject": "Cycling", "color": AppColors.green},
    {"subject": "Yoga", "color": AppColors.yogacolor},
    {"subject": "Running", "color": AppColors.runningcolor},
    {"subject": "Walking", "color": AppColors.grey},
    {"subject": "Workout", "color": AppColors.workoutcolor},
  ];
  List<Map<String, dynamic>> cravinglist = [
    {"subject": "Spicy", "time": "4 times"},
    {"subject": "Salty", "time": "1 time"},
    {"subject": "Sweet", "time": "1 time"},
  ];
  List<Map<String, dynamic>> dayslist = [
    {"days": "MONDAY", "exercise": "Cycling for 32 mins"},
    {"days": "TUESDAY", "exercise": "Yoga for 40 mins"},
    {"days": "WEDNESDAY", "exercise": "Running for 20 mins"},
    {"days": "THURSDAY", "exercise": "Yoga for 19 mins"},
    {"days": "FRIDAY", "exercise": "Walking for 61 mins"},
    {"days": "SATURDAY", "exercise": "Workout for 61 mins"},
    {"days": "SUNDAY", "exercise": "Cycling for 42 mins"},
  ];
  bool isExpanded = false;

  // steps graph
  final List<int> steps = [7000, 10000, 8000, 6000, 9500, 7500, 6200];
  final List<String> days1 = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  // mood graph
  final List<double> values = [5, 4, 3, 2, 4, 3, 3];
  final List<String> days2 = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
}
