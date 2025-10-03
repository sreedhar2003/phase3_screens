import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class LifestyleCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String status;
  final Color? statusColor;
  final Color? cardColor;
  final IconData statusicon;

  const LifestyleCard({
    super.key,
    required this.title,
    required this.statusicon,
    required this.value,
    required this.unit,
    required this.status,
    required this.statusColor,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      width: 162,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(9.23),
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
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 25,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(18.46),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(statusicon, color: AppColors.white, size: 15),
                  sizedBoxWithWidth(5),
                  Text(
                    status,
                    style: GoogleFonts.roboto(
                      color: AppColors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          // Title
          Text(
            title,
            style: GoogleFonts.roboto(
              color: AppColors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),

          sizedBoxWithHeight(5),
          Text(
            "$value $unit",
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
