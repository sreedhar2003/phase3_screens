import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/controller/progresssummary_controller.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/activityitem_card.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/calorie_card.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/circularpercentage_card.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/cpfitem_card.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/expandable_card.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/lifestyle_card.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/moodtrendgraph.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/normalpercentage_card.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/roundedpercentage_card.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/widgets/stepsbarchart.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class ProgresssummaryScreen extends StatefulWidget {
  const ProgresssummaryScreen({super.key});

  @override
  State<ProgresssummaryScreen> createState() => _ProgresssummaryScreenState();
}

class _ProgresssummaryScreenState extends State<ProgresssummaryScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProgresssummaryController>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColors.black,
          ),
        ),
        title: Center(
          child: Text(
            "Progress Summary",
            style: GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: provider.options.map((option) {
                  final bool isSelected = provider.selectedOption == option;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        provider.selectedOption = option;
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 70,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 16,
                      //   vertical: 10,
                      // ),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.green : AppColors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.green, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          option,
                          style: GoogleFonts.roboto(
                            color: isSelected
                                ? AppColors.white
                                : AppColors.green,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              sizedBoxWithHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "June 9, 2025",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.black,
                    size: 20,
                  ),
                ],
              ),
              sizedBoxWithHeight(10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: CalorieCard(
                            title: "Calorie Intake",
                            icon: "assets/images/Calories_intake.png",
                            currentValue: 1560,
                            goalValue: 2200,
                            color: AppColors.green,
                          ),
                        ),
                        sizedBoxWithWidth(10),
                        Expanded(
                          child: CalorieCard(
                            title: "Calorie Burn",
                            icon: "assets/images/calories_burn.png",
                            currentValue: 450,
                            goalValue: 900,
                            color: AppColors.brown,
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CpfItemCard(
                          title: "Carbs",
                          value: 180,
                          percentage: 45,
                          bgcolor: AppColors.containercolor,
                          color: AppColors.green,
                        ),
                        CpfItemCard(
                          title: "Protein",
                          value: 95,
                          percentage: 25,
                          bgcolor: AppColors.lightred,
                          color: AppColors.red,
                        ),
                        CpfItemCard(
                          title: "Fat",
                          value: 60,
                          percentage: 30,
                          bgcolor: AppColors.lightorange,
                          color: AppColors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(20),

              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: RoundpercentageCard(
                      title: "Steps",
                      image: "assets/images/steps_image.png",
                      duration: "50,000",
                      total: "steps",
                      percentage: 1.0,
                      percentagecolor: AppColors.violet,
                    ),
                  ),
                  sizedBoxWithWidth(10),
                  const Expanded(
                    flex: 1,
                    child: RoundpercentageCard(
                      title: "Active Days",
                      image: "assets/images/flash_logo.png",
                      duration: "1/7",
                      total: "days",
                      percentage: 0.25,
                      percentagecolor: AppColors.green,
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(10),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: NormalpercentageCard(
                      title: "Sleep",
                      image: "assets/images/sleep_image.png",
                      duration: "6.1",
                      total: "hours",
                      percentage: 0.7,
                      percentagecolor: AppColors.darkblue,
                    ),
                  ),
                  sizedBoxWithWidth(10),
                  const Expanded(
                    flex: 1,
                    child: NormalpercentageCard(
                      title: "Water",
                      image: "assets/images/waterglass_logo.png",
                      duration: "4-6",
                      total: "glasses",
                      percentage: 0.7,
                      percentagecolor: AppColors.blue,
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(10),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: NormalpercentageCard(
                      title: "Mood",
                      image: "assets/images/mood_image.png",
                      duration: "3.9/5",
                      total: "",
                      percentage: 0.7,
                      percentagecolor: AppColors.orange,
                    ),
                  ),
                  sizedBoxWithWidth(10),
                  const Expanded(
                    flex: 1,
                    child: NormalpercentageCard(
                      title: "Mindful Days",
                      image: "assets/images/head_image.png",
                      duration: "YES",
                      total: "",
                      percentage: 1.0,
                      percentagecolor: AppColors.purple,
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(10),
              const NormalpercentageCard(
                title: "Cravings",
                image: "assets/images/fastfood_image.png",
                duration: "YES",
                total: "",
                percentage: 1.0,
                percentagecolor: AppColors.red,
              ),
              sizedBoxWithHeight(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lifestyle Diseases",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "View all",
                    style: GoogleFonts.roboto(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    provider.Lifestylelist.length,
                    (index) => LifestyleCard(
                      statusicon: provider.Lifestylelist[index]["statusicon"],
                      title: provider.Lifestylelist[index]["title"],
                      value: provider.Lifestylelist[index]["value"],
                      unit: provider.Lifestylelist[index]["unit"],
                      status: provider.Lifestylelist[index]["status"],
                      statusColor: provider.Lifestylelist[index]["statusColor"],
                      cardColor: provider.Lifestylelist[index]["cardColor"],
                    ),
                  ),
                ),
              ),
              sizedBoxWithHeight(20),
              Text(
                "Lifestyle Diseases",
                style: GoogleFonts.roboto(
                  color: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxWithHeight(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CircularpercentageCard(
                      title: "Weight",
                      value: "70",
                      unit: "kg",
                      percent: 0.7, // 70 out of 100
                      color: AppColors.green,
                      statusIcon: "assets/images/normal.png",
                    ),
                  ),
                  sizedBoxWithWidth(10),
                  Expanded(
                    child: CircularpercentageCard(
                      title: "BMI",
                      value: "28.3",
                      unit: "",
                      percent: 0.80,
                      color: AppColors.red,
                      statusIcon: "assets/images/high.png",
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(20),
              Text(
                "Activity",
                style: GoogleFonts.roboto(
                  color: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBoxWithHeight(10),
              ActivityitemCard(
                title: "Workout Duration",
                image: "assets/images/logo_workout.png",
                currentduration: "30 minutes",
                gapduration: "0",
                targetduration: "30 min",
                percentage: 1.0,
                percentagecolor: AppColors.green,
              ),
              sizedBoxWithHeight(10),
              ActivityitemCard(
                title: "Cardio & Flexibility",
                image: "assets/images/logo_workout.png",
                currentduration: "10 minutes",
                gapduration: "10min",
                targetduration: "20 min",
                percentage: 0.5,
                percentagecolor: AppColors.green,
              ),
              sizedBoxWithHeight(20),
              sizedBoxWithHeight(20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                //  change according to
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daily Steps",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(20),
                    StepBarChart(),
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Exercise Breakdown",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(20),
                    Center(
                      child: PieChart(
                        dataMap: provider.dataMap,
                        animationDuration: const Duration(milliseconds: 800),
                        chartRadius: MediaQuery.of(context).size.width / 2.2,
                        colorList: provider.colorList,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 40,
                        legendOptions: const LegendOptions(showLegends: false),
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValues: false,
                        ),
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Column(
                      children: List.generate(
                        provider.exerciselist.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Text(
                                provider.exerciselist[index]["subject"],
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  color: provider.exerciselist[index]["color"],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                //  change according to
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mood Trend (1:Bad - 5:Great)",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(20),
                    MoodtrendGraph(),
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mood Trend (1:Bad - 5:Great)",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(20),
                    Column(
                      children: List.generate(
                        provider.cravinglist.length,
                        (index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              provider.cravinglist[index]["subject"],
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ":",
                              style: GoogleFonts.roboto(
                                color: AppColors.grey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              provider.cravinglist[index]["time"],
                              style: GoogleFonts.roboto(
                                color: AppColors.green,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daily Log Overview",
                      style: GoogleFonts.roboto(
                        color: AppColors.green,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(20),
                    Column(
                      children: List.generate(
                        provider.dayslist.length,
                        (index) => ExpandedCard(
                          day: provider.dayslist[index]["days"],
                          exercise: provider.dayslist[index]["exercise"],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.containercolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/correct_circle.png",
                      height: 20,
                      width: 20,
                      fit: BoxFit.cover,
                    ),
                    sizedBoxWithWidth(5),
                    Expanded(
                      child: Text(
                        "Review your progress regularly to stay motivated and identify patterns!",
                        maxLines: 2,
                        style: GoogleFonts.roboto(
                          color: AppColors.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
