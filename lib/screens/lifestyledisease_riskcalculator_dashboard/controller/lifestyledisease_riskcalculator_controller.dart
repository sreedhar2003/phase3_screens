import 'package:flutter/material.dart';

class LifestylediseaseRiskcalculatorController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController AgeController = TextEditingController();
  final TextEditingController WeightController = TextEditingController();
  final TextEditingController HeightController = TextEditingController();
  // Physical Activity
  bool isOpen1 = false;
  String selected1 = 'Select';
  void togglePhysicalActivity() {
    isOpen1 = !isOpen1;
    notifyListeners();
  }

  void selectOption1(String value) {
    selected1 = value;
    isOpen1 = false;
    notifyListeners();
  }

  // Diet Quality
  bool isOpen2 = false;
  String selected2 = 'Select';
  void toggleDietQuality() {
    isOpen2 = !isOpen2;
    notifyListeners();
  }

  void selectOption2(String value) {
    selected2 = value;
    isOpen2 = false;
    notifyListeners();
  }

  // Do you smoke?
  bool isOpen3 = false;
  String selected3 = 'Select';
  void togglesmoke() {
    isOpen3 = !isOpen3;
    notifyListeners();
  }

  void selectOption3(String value) {
    selected3 = value;
    isOpen3 = false;
    notifyListeners();
  }

  // Alcohol Consumption
  bool isOpen4 = false;
  String selected4 = 'Select';

  void toggleAlcoholConsumption() {
    isOpen4 = !isOpen4;
    notifyListeners();
  }

  void selectOption4(String value) {
    selected4 = value;
    isOpen4 = false;
    notifyListeners();
  }
}
