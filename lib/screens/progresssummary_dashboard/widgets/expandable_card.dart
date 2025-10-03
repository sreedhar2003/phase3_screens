import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/controller/progresssummary_controller.dart';
import 'package:provider/provider.dart';

class ExpandedCard extends StatefulWidget {
  final String day;
  final String exercise;
  const ExpandedCard({super.key, required this.day, required this.exercise});

  @override
  State<ExpandedCard> createState() => _ExpandedCardState();
}

class _ExpandedCardState extends State<ExpandedCard> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProgresssummaryController>();
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                setState(() => provider.isExpanded = !provider.isExpanded),
            child: Container(
              height: 56,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.day,
                          style: GoogleFonts.roboto(
                            color: AppColors.green,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Exercise: ${widget.exercise}",
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      provider.isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (provider.isExpanded)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  buildInfoRow("Steps", "2,871", "assets/images/footprint.png"),
                  buildDivider(),
                  buildInfoRow(
                    "Sleep",
                    "5.4 hrs",
                    "assets/images/icon_sleep.png",
                  ),
                  buildDivider(),
                  buildInfoRow(
                    "Water",
                    "4 glasses",
                    "assets/images/icon_water.png",
                  ),
                  buildDivider(),
                  buildInfoRow("Mood", "Tired", "assets/images/suffering.png"),
                  buildDivider(),
                  buildInfoRow(
                    "Mindfulness",
                    "Yes",
                    "assets/images/mindfulness.png",
                  ),
                  buildDivider(),
                  buildInfoRow("Cravings", "Salty", "assets/images/dinner.png"),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String title, String value, String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$title : ",
                style: GoogleFonts.roboto(
                  color: AppColors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: value,
                style: GoogleFonts.roboto(
                  color: AppColors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Image.asset(image, height: 24, width: 24, fit: BoxFit.cover),
      ],
    );
  }

  Widget buildDivider() {
    return const Divider(color: AppColors.green);
  }
}
