import 'package:flutter/material.dart';
import 'package:phase3_screens/helpers/appcolors.dart';

class SkinImproverController with ChangeNotifier {
  List<Map<String, dynamic>> Factorlist = [
    {"range": "87/100", "title": "Score"},
    {"range": "5/7", "title": "Routine"},
    {"range": "7.5 hrs", "title": "Hydration"},
    {"range": "87/100", "title": "Sleep"},
  ];
  List<Map<String, dynamic>> trackeritemslist = [
    {
      "factor": "Skincare Routine",
      "status": "Completed   (AM + PM)",
      "impact": "Maintained tone",
      "buttontext": "Habit",
      "buttoncolor": AppColors.greencontainer,
      "textcolor": AppColors.green,
    },
    {
      "factor": "Water Intake",
      "status": "2.6L / 3L",
      "impact": "Hydrated skin",
      "buttontext": "Hydration",
      "buttoncolor": AppColors.lightblue,
      "textcolor": AppColors.blue,
    },
    {
      "factor": "Nutrition Score",
      "status": "74 / 100",
      "impact": "Skin-friendly",
      "buttontext": "Diet",
      "buttoncolor": AppColors.lightyellow,
      "textcolor": AppColors.yellow,
    },
    {
      "factor": "Sleep Quality",
      "status": "85%",
      "impact": "Overnight repair",
      "buttontext": "Rest",
      "buttoncolor": AppColors.lightblue,
      "textcolor": AppColors.blue,
    },
    {
      "factor": "Stress Level",
      "status": "Low",
      "impact": "Less inflammation",
      "buttontext": "Wellness",
      "buttoncolor": AppColors.lightred,
      "textcolor": AppColors.red,
    },
  ];
  final TextEditingController notesController = TextEditingController();
  final TextEditingController medicineController = TextEditingController();
  final List<double> values = [10, 13, 11, 14, 10, 12, 14];

  final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
}
