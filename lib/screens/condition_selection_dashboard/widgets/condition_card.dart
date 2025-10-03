import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/controller/condition_selection_controller.dart';
import 'package:provider/provider.dart';

class ConditionCard extends StatefulWidget {
  final String image;
  final String heading;
  final String subheading;
  const ConditionCard({
    super.key,
    required this.image,
    required this.heading,
    required this.subheading,
  });

  @override
  State<ConditionCard> createState() => _ConditionCardState();
}

class _ConditionCardState extends State<ConditionCard> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConditionSelectionController>();
    ScreenUtil.getInstance().init(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          provider.isExpands = !provider.isExpands;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.image,
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
                sizedBoxWithWidth(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.heading,
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(2),
                    Text(
                      widget.subheading,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  provider.isExpands
                      ? Icons.check_circle_rounded
                      : Icons.radio_button_unchecked,
                  color: provider.isExpands ? AppColors.green : AppColors.green,
                ),
              ],
            ),

            /// Expanded content
            if (provider.isExpands) ...[
              sizedBoxWithHeight(15),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: ['PREVENT', 'MANAGE', 'REVERSE']
                      .map(
                        (option) => Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                provider.selectedButton = option;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: provider.selectedButton == option
                                    ? AppColors.green
                                    : AppColors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  option,
                                  style: GoogleFonts.roboto(
                                    color: provider.selectedButton == option
                                        ? AppColors.white
                                        : AppColors.green,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),

              sizedBoxWithHeight(10),
              // Description
              Text(
                "Take early action to stay healthy and avoid future health issues.",
                maxLines: 2,
                style: GoogleFonts.roboto(
                  color: AppColors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
