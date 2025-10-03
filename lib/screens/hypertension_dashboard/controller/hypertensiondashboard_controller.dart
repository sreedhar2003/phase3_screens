import 'package:flutter/widgets.dart';

class HypertensiondashboardController with ChangeNotifier {
  bool isExpanded = false; //alcohol consumption
  String? selectedoptions;

  final List<String> alcoholoptions = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4",
  ];
}
