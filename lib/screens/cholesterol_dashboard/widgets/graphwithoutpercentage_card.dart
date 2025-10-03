import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class GraphwithoutpercentageCard extends StatefulWidget {
  final String title;
  final String rating;
  final String status;
  final Color statusColor;
  final String statusimage;

  const GraphwithoutpercentageCard({
    super.key,
    required this.title,
    required this.rating,
    required this.status,
    required this.statusColor,
    required this.statusimage,
  });

  @override
  State<GraphwithoutpercentageCard> createState() =>
      _GraphwithoutpercentageCardState();
}

class _GraphwithoutpercentageCardState
    extends State<GraphwithoutpercentageCard> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

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
        children: [
          GestureDetector(
            onTap: _toggleExpand,
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Text(
                  _isExpanded ? "view graph" : "View graph",
                  style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                sizedBoxWithWidth(5),
                Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: AppColors.black,
                  size: 24,
                ),
              ],
            ),
          ),
          sizedBoxWithHeight(10),
          Row(
            children: [
              Text(
                widget.rating,
                maxLines: 2,
                style: GoogleFonts.roboto(
                  color: AppColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Image.asset(widget.statusimage, height: 16.h, width: 16.w),
              sizedBoxWithWidth(4),
              Text(
                widget.status,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: widget.statusColor,
                ),
              ),
            ],
          ),
          if (_isExpanded) ...[
            sizedBoxWithHeight(12),
            // TODO: Replace this with actual graph or chart widget
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        height: 56.h,
                        width: 133.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black),
                          color: AppColors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Weekly",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            sizedBoxWithWidth(10),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 25,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  sizedBoxWithHeight(50),
                  Text(
                    "Graph/Details for ${widget.title}",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
