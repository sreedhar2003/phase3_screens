import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/controller/condition_selection_controller.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/widgets/condition_card.dart';
import 'package:provider/provider.dart';

class ConditionTab extends StatelessWidget {
  const ConditionTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ConditionSelectionController>();
    ScreenUtil.getInstance().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Condition Selection",
              style: GoogleFonts.roboto(
                color: AppColors.green,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            sizedBoxWithHeight(10),
            Text(
              "Help us understand what you're dealing with, so we can provide the best care.",
              maxLines: 2,
              style: GoogleFonts.roboto(
                color: AppColors.grey,
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            sizedBoxWithHeight(10),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(82),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextFormField(
                controller: provider.ConditionController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for a conditions',
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            sizedBoxWithHeight(10),
            Row(
              children: [
                Spacer(),
                Text(
                  "Select All",
                  style: GoogleFonts.roboto(
                    color: AppColors.green,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                sizedBoxWithWidth(5),
                const Icon(
                  Icons.check_circle_outline,
                  size: 20,
                  color: AppColors.green,
                ),
              ],
            ),
            sizedBoxWithHeight(10),
            Column(
              children: List.generate(
                provider.conditions.length,
                (index) => ConditionCard(
                  image: provider.conditions[index]["image"]?.toString() ?? '',
                  heading:
                      provider.conditions[index]["heading"]?.toString() ?? '',
                  subheading:
                      provider.conditions[index]["subheading"]?.toString() ??
                      '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
