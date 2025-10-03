import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class CpfItemCard extends StatelessWidget {
  final String title;
  final int value;
  final int percentage;
  final Color bgcolor;
  final Color color;

  const CpfItemCard({
    super.key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.bgcolor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        sizedBoxWithHeight(5),

        // Gradient progress bar
        Stack(
          children: [
            // Background bar (grey)
            Container(
              height: 3,
              width: 52,
              decoration: BoxDecoration(
                color: bgcolor,
                borderRadius: BorderRadius.circular(6),
              ),
            ),

            // Foreground progress (gradient)
            Container(
              height: 3,
              width: (percentage / 100) * 100, // relative width
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(0.6)],
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ],
        ),
        sizedBoxWithHeight(5),

        // Value and percentage text
        Text(
          "${value}g ($percentage%)",
          style: GoogleFonts.roboto(
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
