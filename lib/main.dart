import 'package:flutter/material.dart';
import 'package:phase3_screens/screens/360_profile_dashboard/controller/profile360_controller.dart';
import 'package:phase3_screens/screens/360_profile_dashboard/screens/360_profile_withconsent.dart';
import 'package:phase3_screens/screens/360_profile_dashboard/screens/360_profile_withoutconsent.dart';
import 'package:phase3_screens/screens/alcoholic_fattyliver_dashboard/controller/alcoholic_fattyliver_controller.dart';
import 'package:phase3_screens/screens/alcoholic_fattyliver_dashboard/screen/alcoholic_fattyliver_screen.dart';
import 'package:phase3_screens/screens/cholesterol_dashboard/controller/cholesteroldashboard_controller.dart';
import 'package:phase3_screens/screens/cholesterol_dashboard/screen/cholesteroldashboard_screen.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/controller/condition_selection_controller.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/screen/condition_selection_screen.dart';
import 'package:phase3_screens/screens/diabetes_dashboard/controller/diabetesdashboard_controller.dart';
import 'package:phase3_screens/screens/diabetes_dashboard/screen/diabetesdashboard_screen.dart';
import 'package:phase3_screens/screens/hypertension_dashboard/controller/hypertensiondashboard_controller.dart';
import 'package:phase3_screens/screens/hypertension_dashboard/screen/hypertensiondashboard_screen.dart';
import 'package:phase3_screens/screens/lifestyledisease_riskcalculator_dashboard/controller/lifestyledisease_riskcalculator_controller.dart';
import 'package:phase3_screens/screens/lifestyledisease_riskcalculator_dashboard/screen/lifestyledisease_riskcalculator_screen.dart';
import 'package:phase3_screens/screens/nonalcoholic_fattyliver_dashboard/controller/nonalcoholic_fattyliver_controller.dart';
import 'package:phase3_screens/screens/nonalcoholic_fattyliver_dashboard/screen/nonalcoholic_fattyliver_screen.dart';
import 'package:phase3_screens/screens/obesity_dashboard/controller/obesitydashboard_controller.dart';
import 'package:phase3_screens/screens/obesity_dashboard/screen/obesitydashboard_screen.dart';
import 'package:phase3_screens/screens/pcos_dashboard/controller/pcosdashboard_controller.dart';
import 'package:phase3_screens/screens/pcos_dashboard/screen/pcosdashboard_screen.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/controller/progresssummary_controller.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/screen/progresssummary_screen.dart';
import 'package:phase3_screens/screens/skin_improver_dashboard/controller/skin_improver_controller.dart';
import 'package:phase3_screens/screens/skin_improver_dashboard/screen/skin_improver_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SkinImproverController()),
        ChangeNotifierProvider(
          create: (context) => ProgresssummaryController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConditionSelectionController(),
        ),
        ChangeNotifierProvider(create: (context) => Profile360Controller()),
        ChangeNotifierProvider(
          create: (context) => LifestylediseaseRiskcalculatorController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AlcoholicFattyliverController(),
        ),
        ChangeNotifierProvider(
          create: (context) => NonalcoholicFattyliverController(),
        ),
        ChangeNotifierProvider(create: (context) => PcosdashboardController()),
        ChangeNotifierProvider(
          create: (context) => ObesitydashboardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CholesteroldashboardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HypertensiondashboardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DiabetesdashboardController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SkinImproverScreen(),
      //ProgresssummaryScreen(),
      //ConditionSelectionScreen(),
      //Profile360withoutconsent(),
      //Profile360Withconsent(),
      //LifestylediseaseRiskcalculatorScreen(),
      //AlcoholicFattyliverScreen(),
      //NonalcoholicFattyliverScreen(),
      //PcosdashboardScreen(),
      //CholesteroldashboardScreen(),
      //ObesitydashboardScreen(),
      //HypertensiondashboardScreen(),
      // DiabetesdashboardScreen(),
    );
  }
}
