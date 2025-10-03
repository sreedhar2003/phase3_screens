import 'package:flutter/material.dart';

class Profile360Controller with ChangeNotifier {
  int selectedindexwithoutconsent = 0;
  List<String> categorylistwithoutconsent = [
    "Encounter",
    "Triage",
    "Treatment History"
  ];
  int selectedindexwithconsent = 0;
  List<String> categorylistwithconsent = [
    "Overview",
    "Vitals",
    "Encounter",
    "Triage",
    "Treatment History"
  ];
}
