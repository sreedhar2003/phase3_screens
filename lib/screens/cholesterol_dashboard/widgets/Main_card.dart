import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class MainCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String status;
  final Color statusColor;
  final Color cardColor;
  final bool isHigh;
  final graph;

  const MainCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.status,
    required this.statusColor,
    required this.cardColor,
    this.isHigh = false,
    required this.graph,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(18.46),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isHigh ? Icons.error : Icons.check_circle,
                    color: Colors.white,
                    size: 14,
                  ),
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
          sizedBoxWithHeight(30),

          // Title
          Text(
            title,
            maxLines: 2,
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
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          sizedBoxWithHeight(10),

          // Button
          SizedBox(
            height: 44,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: graph,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // remove default padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Colors.transparent, // important for gradient
                shadowColor: Colors.transparent,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.gradientcolor1,
                      AppColors.gradientcolor2,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(75.69),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "View Graph",
                    style: GoogleFonts.roboto(
                      color: AppColors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
