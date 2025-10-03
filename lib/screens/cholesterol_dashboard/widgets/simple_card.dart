import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class SimpleCard extends StatelessWidget {
  final String title;
  final String rating;

  const SimpleCard({super.key, required this.title, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 89.h,
      // width: 343.w,
      width: double.infinity,
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
          Text(
            title,
            style: GoogleFonts.roboto(
              color: AppColors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),

          sizedBoxWithHeight(10),
          Text(
            rating,
            maxLines: 2,
            style: GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
