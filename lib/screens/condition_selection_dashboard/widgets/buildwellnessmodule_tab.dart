import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/controller/condition_selection_controller.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/widgets/custom_dropdownbuttons.dart';
import 'package:phase3_screens/screens/condition_selection_dashboard/widgets/wellnessmodules_card.dart';
import 'package:provider/provider.dart';

class WellnessmoduleTab extends StatefulWidget {
  const WellnessmoduleTab({super.key});

  @override
  State<WellnessmoduleTab> createState() => _WellnessmoduleTabState();
}

class _WellnessmoduleTabState extends State<WellnessmoduleTab> {
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
              "Wellness Modules",
              style: GoogleFonts.roboto(
                color: AppColors.green,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            sizedBoxWithHeight(10),
            Text(
              "Choose the wellness modules that align with your lifestyle—each one enhances your journey toward better health.",
              maxLines: 3,
              style: GoogleFonts.roboto(
                color: AppColors.grey,
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            sizedBoxWithHeight(10),
            GestureDetector(
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
                          "assets/images/weight_loss.png",
                          height: 31,
                          width: 36,
                          fit: BoxFit.contain,
                        ),
                        sizedBoxWithWidth(10),
                        Text(
                          "Weight Loss",
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
                      sizedBoxWithHeight(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                  "Burn fat, not motivation—get a tailored plan that blends habits, movement, and mindful eating to support long-term, healthy weight loss.",
                                  maxLines: 3,
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          sizedBoxWithHeight(5),
                          Text(
                            "Weight Loss Tracking Setup",
                            style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          sizedBoxWithHeight(5),
                          Form(
                            key: provider.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Current Weight (kg)",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sizedBoxWithHeight(5),
                                TextFormField(
                                  controller: provider.CurrentweightController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your current weight",
                                    hintStyle: GoogleFonts.roboto(
                                      color: AppColors.grey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.white,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                sizedBoxWithHeight(5),
                                Text(
                                  "Target Weight (kg)",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sizedBoxWithHeight(5),
                                TextFormField(
                                  controller: provider.TargetweightController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your target weight",
                                    hintStyle: GoogleFonts.roboto(
                                      color: AppColors.grey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.white,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                sizedBoxWithHeight(5),
                                Text(
                                  "How many Days?",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sizedBoxWithHeight(5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: provider.DayController,
                                        decoration: InputDecoration(
                                          hintText: "Enter your days",
                                          hintStyle: GoogleFonts.roboto(
                                            color: AppColors.grey,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 16,
                                              ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                            borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: AppColors.white,
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    sizedBoxWithWidth(10),
                                    Expanded(
                                      child: CustomDropdownbuttons(
                                        options: ['Days', 'Weeks', 'Months'],
                                        selectedValue: provider.selected,
                                        isOpen: provider.isOpen,
                                        onTap: () => provider.toggleActivity(),
                                        onSelect: (value) =>
                                            provider.selectOption(value),
                                      ),
                                    ),
                                  ],
                                ),
                                sizedBoxWithHeight(5),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "“Please fill the required fields to continue.”",
                                    style: GoogleFonts.roboto(
                                      color: AppColors.red,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            sizedBoxWithHeight(5),
            Column(
              children: List.generate(
                provider.wellnessmodule.length,
                (index) => WellnessmoduleCard(
                  image:
                      provider.wellnessmodule[index]["image"]?.toString() ?? '',
                  heading:
                      provider.wellnessmodule[index]["heading"]?.toString() ??
                      '',
                  description:
                      provider.wellnessmodule[index]["description"]
                          ?.toString() ??
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
