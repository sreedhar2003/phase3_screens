import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/controller/condition_selection_controller.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/widgets/buildwellnessmodule_tab.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/widgets/buildcondition_tab.dart';
import 'package:provider/provider.dart';

class ConditionSelectionScreen extends StatefulWidget {
  @override
  _ConditionSelectionScreenState createState() =>
      _ConditionSelectionScreenState();
}

class _ConditionSelectionScreenState extends State<ConditionSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConditionSelectionController>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
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
            "Select Your Conditions",
            style: GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Custom Tab Bar
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => provider.selectedTabIndex = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: provider.selectedTabIndex == 0
                              ? AppColors.white
                              : AppColors.green,
                        ),
                        color: provider.selectedTabIndex == 0
                            ? AppColors.green
                            : AppColors.transparent,
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Center(
                        child: Text(
                          'Conditions',
                          style: TextStyle(
                            color: provider.selectedTabIndex == 0
                                ? AppColors.white
                                : AppColors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => provider.selectedTabIndex = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: provider.selectedTabIndex == 0
                              ? AppColors.white
                              : AppColors.green,
                        ),
                        color: provider.selectedTabIndex == 1
                            ? AppColors.green
                            : AppColors.transparent,
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Center(
                        child: Text(
                          'Wellness Modules',
                          style: GoogleFonts.roboto(
                            color: provider.selectedTabIndex == 1
                                ? AppColors.white
                                : AppColors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: provider.selectedTabIndex == 0
                ? ConditionTab()
                : WellnessmoduleTab(),
          ),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // Handle continue action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Continue',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
