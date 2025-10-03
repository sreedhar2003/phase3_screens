import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

void showDialoggraph(
  BuildContext context,
  String subject,
  String rate,
  String status,
  String statusimage,
  Color statuscolor,
  Widget graph,
) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, size: 20, color: AppColors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4.66),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: GoogleFonts.roboto(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        rate,
                        style: GoogleFonts.roboto(
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(
                        statusimage,
                        height: 14,
                        width: 14,
                        fit: BoxFit.contain,
                      ),
                      sizedBoxWithWidth(5),
                      Text(
                        status,
                        style: GoogleFonts.roboto(
                          color: statuscolor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  sizedBoxWithHeight(10),
                  // Dropdown
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 52.h,
                      width: 124.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black),
                        color: AppColors.white,
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          value: "Weekly",
                          items: ["Weekly", "Monthly"]
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: GoogleFonts.roboto(
                                      color: AppColors.black,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (val) {},
                        ),
                      ),
                    ),
                  ),

                  sizedBoxWithHeight(10),

                  // Chart
                  SizedBox(height: 200, child: graph),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
