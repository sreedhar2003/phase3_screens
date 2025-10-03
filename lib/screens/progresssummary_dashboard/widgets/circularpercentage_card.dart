import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class CircularpercentageCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final double percent; // between 0.0 - 1.0
  final Color color;
  final String statusIcon;

  const CircularpercentageCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.percent,
    required this.color,
    required this.statusIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Image.asset(
                statusIcon,
                height: 16,
                width: 16,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(height: 10),

          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    value: percent,
                    strokeWidth: 6,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: GoogleFonts.roboto(
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        color: color,
                      ),
                    ),
                    Text(
                      unit,
                      style: GoogleFonts.roboto(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          sizedBoxWithHeight(20),
        ],
      ),
    );
  }
}
