import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class Cardwithoutexpand extends StatelessWidget {
  final String title;
  final String rating;
  final String status;
  final Color statusColor;
  final String statusimage;

  const Cardwithoutexpand({
    super.key,
    required this.title,
    required this.rating,
    required this.status,
    required this.statusColor,
    required this.statusimage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 89.h,
      // width: 343.w,
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
          Row(
            children: [
              Text(
                rating,
                maxLines: 2,
                style: GoogleFonts.roboto(
                  color: AppColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Image.asset(statusimage, height: 16.h, width: 16.w),
              sizedBoxWithWidth(4),
              Text(
                status,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
