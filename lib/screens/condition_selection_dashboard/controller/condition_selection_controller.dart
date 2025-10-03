import 'package:flutter/material.dart';

class ConditionSelectionController with ChangeNotifier {
  int selectedTabIndex = 0; // 0 for Conditions, 1 for Add-ons
  final TextEditingController ConditionController = TextEditingController();

  // Conditions data
  List<Map<String, dynamic>> conditions = [
    {
      "heading": "Diabetes",
      "subheading": "Manage blood sugar levels",
      "image": "assets/images/diabetes_image.png",
    },
    {
      "heading": 'Hypertension',
      "subheading": 'Monitor your blood pressure',
      "image": "assets/images/hypertension_image.png",
    },
    {
      "heading": 'Obesity',
      "subheading": 'Lifestyle and weight care',
      "image": "assets/images/obesity_image.png",
    },
    {
      "heading": 'Depression',
      "subheading": 'Joint and pain management',
      "image": "assets/images/depression_image.png",
    },
  ];

  // Add-ons data
  List<Map<String, dynamic>> wellnessmodule = [
    {
      "heading": 'Productivity Booster',
      "image": "assets/images/producty_boaster.png",
      "description":
          'Unlock sharper focus, better energy, and smarter routines to power through your day.',
    },
    {
      "heading": 'Skin Improver',
      "image": "assets/images/skin_improver.png",
      "description":
          'Glow from within—get guidance on hydration, nutrition, and habits that support healthy skin.',
    },
    {
      "heading": 'Stress Reducer',
      "image": "assets/images/stress_reducer.png",
      "description":
          'Breathe easier—discover tools and habits to calm your mind and reduce daily stress.',
    },
    {
      "heading": 'Sleep Improver',
      "image": "assets/images/sleep_improver.png",
      "description":
          'Rest better—optimize your sleep quality with science-backed routines and smart reminders.',
    },
    {
      "heading": 'Muscle Builder',
      "image": "assets/images/muscle_builder.png",
      "description":
          'Build strength the smart way—personalized routines, recovery tips, and nutrition insights to help you gain lean muscle safely and sustainably.',
    },
  ];

  bool isExpanded = false; //addon card expands

  bool isExpands = false; //condition card expands
  String selectedButton = 'MANAGE';

  //weight loss properties
  final formKey = GlobalKey<FormState>();
  final TextEditingController CurrentweightController = TextEditingController();
  final TextEditingController TargetweightController = TextEditingController();
  final TextEditingController DayController = TextEditingController();

  bool isOpen = false;
  String selected = 'Select';
  void toggleActivity() {
    isOpen = !isOpen;
    notifyListeners();
  }

  void selectOption(String value) {
    selected = value;
    isOpen = false;
    notifyListeners();
  }
}
