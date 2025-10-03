import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/lifestyledisease_riskcalculator_dashboard/controller/lifestyledisease_riskcalculator_controller.dart';
import 'package:phase3_screens/screens/lifestyledisease_riskcalculator_dashboard/widgets/custom_dropdownbuttons.dart';
import 'package:phase3_screens/screens/lifestyledisease_riskcalculator_dashboard/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class LifestylediseaseRiskcalculatorScreen extends StatefulWidget {
  const LifestylediseaseRiskcalculatorScreen({super.key});

  @override
  State<LifestylediseaseRiskcalculatorScreen> createState() =>
      _LifestylediseaseRiskcalculatorScreenState();
}

class _LifestylediseaseRiskcalculatorScreenState
    extends State<LifestylediseaseRiskcalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LifestylediseaseRiskcalculatorController>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColors.black,
          ),
        ),
        title: Center(
          child: Text(
            "Lifestyle Disease Risk Calculator",
            style: GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Lifestyle Disease Risk Calculator",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: AppColors.green,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              sizedBoxWithHeight(20),
              Form(
                key: provider.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Age:",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    CustomTextfield(
                      hinttext: "",
                      textfieldcontroller: provider.AgeController,
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Weight (kg):",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    CustomTextfield(
                      hinttext: "",
                      textfieldcontroller: provider.AgeController,
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Height (cm):",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    CustomTextfield(
                      hinttext: "",
                      textfieldcontroller: provider.AgeController,
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Physical Activity:",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    CustomDropdownbuttons(
                      options: ['Sedentary', 'Moderate', 'Active'],
                      selectedValue: provider.selected1,
                      isOpen: provider.isOpen1,
                      onTap: () => provider.togglePhysicalActivity(),
                      onSelect: (value) => provider.selectOption1(value),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Diet Quality:",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    CustomDropdownbuttons(
                      options: ['Unhealthy', 'Average', 'Healthy'],
                      selectedValue: provider.selected2,
                      isOpen: provider.isOpen2,
                      onTap: () => provider.toggleDietQuality(),
                      onSelect: (value) => provider.selectOption2(value),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Do you smoke?",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    CustomDropdownbuttons(
                      options: ['Yes', 'No'],
                      selectedValue: provider.selected3,
                      isOpen: provider.isOpen3,
                      onTap: () => provider.togglesmoke(),
                      onSelect: (value) => provider.selectOption3(value),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Alcohol Consumption:",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    CustomDropdownbuttons(
                      options: ['High', 'Moderate', 'None'],
                      selectedValue: provider.selected4,
                      isOpen: provider.isOpen4,
                      onTap: () => provider.toggleAlcoholConsumption(),
                      onSelect: (value) => provider.selectOption4(value),
                    ),
                    sizedBoxWithHeight(20),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 297,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF00C853),
                              const Color(0xFF00E676),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(82),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: (gradientColors?[0] ?? const Color(0xFF00C853)).withOpacity(0.3),
                          //     blurRadius: 12,
                          //     offset: const Offset(0, 6),
                          //   ),
                          // ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // add function
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Calculate Risk",
                              style: GoogleFonts.roboto(
                                color: AppColors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
