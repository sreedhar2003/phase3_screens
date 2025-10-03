import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class TrackerItems extends StatelessWidget {
  final String factor;
  final String status;
  final String impact;
  final String buttontext;
  final Color buttoncolor;
  final Color textcolor;
  const TrackerItems({
    super.key,
    required this.factor,
    required this.status,
    required this.impact,
    required this.buttontext,
    required this.buttoncolor,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  factor,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              sizedBoxWithWidth(30),
              Expanded(
                child: Text(
                  status,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  impact,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          sizedBoxWithHeight(10),
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: buttoncolor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                buttontext,
                style: GoogleFonts.roboto(
                  color: textcolor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
