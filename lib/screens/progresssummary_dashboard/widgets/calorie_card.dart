import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class CalorieCard extends StatelessWidget {
  final String title;
  final String icon;
  final int currentValue;
  final int goalValue;
  final Color color;

  const CalorieCard({
    super.key,
    required this.title,
    required this.icon,
    required this.currentValue,
    required this.goalValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double percent = (currentValue / goalValue).clamp(0.0, 1.0);

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  color: AppColors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image.asset(icon, height: 14, width: 8, fit: BoxFit.contain),
            ],
          ),
          sizedBoxWithHeight(10),

          // Circular progress
          CircularPercentIndicator(
            radius: 50,
            lineWidth: 15,
            percent: percent,
            progressColor: color,
            backgroundColor: color.withOpacity(0.2),
            circularStrokeCap: CircularStrokeCap.round,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$currentValue/ ",
                  style: GoogleFonts.roboto(
                    color: color,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "$goalValue kcal",
                  style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
