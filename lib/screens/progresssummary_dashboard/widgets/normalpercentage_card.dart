import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class NormalpercentageCard extends StatelessWidget {
  final String title;
  final String image;
  final String duration;
  final String total;
  final double percentage;
  final Color percentagecolor;
  const NormalpercentageCard({
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          RichText(
            text: TextSpan(
              // style: TextStyle(fontSize: 18),
              children: [
                TextSpan(
                  text: duration,
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: total,
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          sizedBoxWithHeight(5),
          LinearProgressIndicator(
            value: percentage,
            minHeight: 8.h,
            borderRadius: BorderRadius.circular(25),
            color: percentagecolor,
            backgroundColor: AppColors.lightgrey,
          ),
        ],
      ),
    );
  }
}
