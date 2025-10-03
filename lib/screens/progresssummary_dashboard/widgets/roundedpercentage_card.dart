import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class RoundpercentageCard extends StatelessWidget {
  final String title;
  final String image;
  final String duration;
  final String total;
  final double percentage;
  final Color percentagecolor;
  const RoundpercentageCard({
    super.key,
    required this.title,
    required this.image,
    required this.duration,
    required this.total,
    required this.percentage,
    required this.percentagecolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
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
        children: [
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  color: AppColors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Image.asset(image, height: 24, width: 24, fit: BoxFit.contain),
            ],
          ),
          sizedBoxWithHeight(10),
          Center(
            child: CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 12.0,
              percent: percentage, // 75% progress
              backgroundColor: AppColors.lightgrey,
              progressColor: percentagecolor,
              circularStrokeCap: CircularStrokeCap.round,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    duration,
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    total,
                    style: GoogleFonts.roboto(
                      color: AppColors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
