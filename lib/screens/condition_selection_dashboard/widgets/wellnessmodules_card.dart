import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/controller/condition_selection_controller.dart';
import 'package:provider/provider.dart';

class WellnessmoduleCard extends StatefulWidget {
  final String image;
  final String heading;
  final String description;
  const WellnessmoduleCard({
    super.key,
    required this.image,
    required this.heading,
    required this.description,
  });

  @override
  State<WellnessmoduleCard> createState() => _WellnessmoduleCardState();
}

class _WellnessmoduleCardState extends State<WellnessmoduleCard> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConditionSelectionController>();
    ScreenUtil.getInstance().init(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          provider.isExpanded = !provider.isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
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
                  height: 31,
                  width: 36,
                  fit: BoxFit.contain,
                ),
                sizedBoxWithWidth(10),
                Text(
                  widget.heading,
                  style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  provider.isExpanded
                      ? Icons.check_circle_rounded
                      : Icons.radio_button_unchecked,
                  color: provider.isExpanded
                      ? AppColors.green
                      : AppColors.green,
                ),
              ],
            ),
            if (provider.isExpanded) ...[
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• ",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.description,
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
