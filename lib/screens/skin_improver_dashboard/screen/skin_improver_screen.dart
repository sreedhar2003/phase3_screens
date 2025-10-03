import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/skin_improver_dashboard/controller/skin_improver_controller.dart';
import 'package:phase3_screens/screens/skin_improver_dashboard/widgets/tracker_items.dart';
import 'package:provider/provider.dart';

class SkinImproverScreen extends StatefulWidget {
  const SkinImproverScreen({super.key});

  @override
  State<SkinImproverScreen> createState() => _SkinImproverScreenState();
}

class _SkinImproverScreenState extends State<SkinImproverScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SkinImproverController>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
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
            "Skin Improver",
            style: GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.green)),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: AppColors.transparent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Vineeth",
                    style: GoogleFonts.roboto(
                      color: AppColors.textcolor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sizedBoxWithHeight(5),
                  Row(
                    children: [
                      Text(
                        "Your skin is glowing better each day",
                        style: GoogleFonts.roboto(
                          color: AppColors.textcolor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      sizedBoxWithWidth(10),
                      Image.asset(
                        "assets/images/stars_symbol.png",
                        height: 19,
                        width: 19,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  sizedBoxWithHeight(5),
                  Text(
                    "Skin Type: Dry & Sensitivity",
                    style: GoogleFonts.roboto(
                      color: AppColors.textcolor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  sizedBoxWithHeight(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      provider.Factorlist.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Text(
                              provider.Factorlist[index]["range"],
                              style: GoogleFonts.roboto(
                                color: AppColors.green,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              provider.Factorlist[index]["title"],
                              style: GoogleFonts.roboto(
                                color: AppColors.textcolor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today’s Skin Health Tracker",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sizedBoxWithHeight(15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "FACTOR",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "STATUS",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "IMPACT",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: AppColors.grey),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            provider.trackeritemslist.length,
                            (index) => TrackerItems(
                              factor:
                                  provider.trackeritemslist[index]["factor"],
                              status:
                                  provider.trackeritemslist[index]["status"],
                              impact:
                                  provider.trackeritemslist[index]["impact"],
                              buttontext: provider
                                  .trackeritemslist[index]["buttontext"],
                              buttoncolor: provider
                                  .trackeritemslist[index]["buttoncolor"],
                              textcolor:
                                  provider.trackeritemslist[index]["textcolor"],
                            ),
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(82),
                            color: AppColors.buttoncolor,
                          ),
                          child: Center(
                            child: Text(
                              "View Log",
                              style: GoogleFonts.roboto(
                                color: AppColors.grey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxWithHeight(20),
                  Text(
                    "Visual Journal (Skin Dairy)",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sizedBoxWithHeight(15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/calendar.png",
                              height: 18,
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                            sizedBoxWithWidth(5),
                            Text(
                              "Today’s Entry:",
                              style: GoogleFonts.roboto(
                                color: AppColors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(15),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(82),
                              gradient: const LinearGradient(
                                colors: [
                                  AppColors.green,
                                  Color.fromARGB(255, 133, 231, 111),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 20,
                                  color: AppColors.white,
                                ),
                                sizedBoxWithWidth(10),
                                Text(
                                  "Add Skin Photo",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: provider.notesController,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              hintText: "Note: “Face less oily than usual”",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: provider.medicineController,
                            maxLines: 2,
                            decoration: const InputDecoration(
                              hintText:
                                  "Used: Vitamin C Serum, Moisturizer, Sunscreen",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.grey,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(82),
                              color: AppColors.buttoncolor,
                            ),
                            child: Center(
                              child: Text(
                                "View Photo History",
                                style: GoogleFonts.roboto(
                                  color: AppColors.grey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxWithHeight(20),
                  Text(
                    "Weekly Progress Highlights",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sizedBoxWithHeight(15),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hydration Trend",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              sizedBoxWithHeight(10),
                              SizedBox(
                                height: 200,
                                child: BarChart(
                                  BarChartData(
                                    alignment: BarChartAlignment.spaceAround,
                                    maxY: 16,
                                    barTouchData: BarTouchData(enabled: false),
                                    titlesData: FlTitlesData(
                                      leftTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      topTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      rightTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: (value, meta) {
                                            return Text(
                                              provider.days[value.toInt()],
                                              style: GoogleFonts.roboto(
                                                color: AppColors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            );
                                          },
                                          reservedSize: 30,
                                        ),
                                      ),
                                    ),
                                    borderData: FlBorderData(show: false),
                                    barGroups: List.generate(
                                      provider.values.length,
                                      (index) => BarChartGroupData(
                                        x: index,
                                        barRods: [
                                          BarChartRodData(
                                            toY: provider.values[index],
                                            width: 16,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                ),
                                            color: AppColors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sleep Hours",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              sizedBoxWithHeight(10),
                              SizedBox(
                                height: 200,
                                child: BarChart(
                                  BarChartData(
                                    alignment: BarChartAlignment.spaceAround,
                                    maxY: 16,
                                    barTouchData: BarTouchData(enabled: false),
                                    titlesData: FlTitlesData(
                                      leftTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      topTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      rightTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: (value, meta) {
                                            return Text(
                                              provider.days[value.toInt()],
                                              style: GoogleFonts.roboto(
                                                color: AppColors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            );
                                          },
                                          reservedSize: 30,
                                        ),
                                      ),
                                    ),
                                    borderData: FlBorderData(show: false),
                                    barGroups: List.generate(
                                      provider.values.length,
                                      (index) => BarChartGroupData(
                                        x: index,
                                        barRods: [
                                          BarChartRodData(
                                            toY: provider.values[index],
                                            width: 16,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                ),
                                            color: AppColors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Routine Consistency",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              sizedBoxWithHeight(10),
                              SizedBox(
                                height: 200,
                                child: BarChart(
                                  BarChartData(
                                    alignment: BarChartAlignment.spaceAround,
                                    maxY: 16,
                                    barTouchData: BarTouchData(enabled: false),
                                    titlesData: FlTitlesData(
                                      leftTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      topTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      rightTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: (value, meta) {
                                            return Text(
                                              provider.days[value.toInt()],
                                              style: GoogleFonts.roboto(
                                                color: AppColors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            );
                                          },
                                          reservedSize: 30,
                                        ),
                                      ),
                                    ),
                                    borderData: FlBorderData(show: false),
                                    barGroups: List.generate(
                                      provider.values.length,
                                      (index) => BarChartGroupData(
                                        x: index,
                                        barRods: [
                                          BarChartRodData(
                                            toY: provider.values[index],
                                            width: 16,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                ),
                                            color: AppColors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Skin Glow Score",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              sizedBoxWithHeight(10),
                              SizedBox(
                                height: 200,
                                child: BarChart(
                                  BarChartData(
                                    alignment: BarChartAlignment.spaceAround,
                                    maxY: 16,
                                    barTouchData: BarTouchData(enabled: false),
                                    titlesData: FlTitlesData(
                                      leftTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      topTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      rightTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      bottomTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          getTitlesWidget: (value, meta) {
                                            return Text(
                                              provider.days[value.toInt()],
                                              style: GoogleFonts.roboto(
                                                color: AppColors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            );
                                          },
                                          reservedSize: 30,
                                        ),
                                      ),
                                    ),
                                    borderData: FlBorderData(show: false),
                                    barGroups: List.generate(
                                      provider.values.length,
                                      (index) => BarChartGroupData(
                                        x: index,
                                        barRods: [
                                          BarChartRodData(
                                            toY: provider.values[index],
                                            width: 16,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                ),
                                            color: AppColors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/brain_logo.png",
                                    height: 16,
                                    width: 16,
                                    fit: BoxFit.cover,
                                  ),
                                  sizedBoxWithWidth(5),
                                  Text(
                                    "AI Insight:",
                                    style: GoogleFonts.roboto(
                                      color: AppColors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              sizedBoxWithHeight(10),
                              Text(
                                "“Your skin glow was highest on days after 7+ hrs sleep & full hydration. Keep going!”",
                                maxLines: 2,
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxWithHeight(20),
                  Text(
                    "Personal Goals & Milestones",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sizedBoxWithHeight(10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/target.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                            sizedBoxWithWidth(5),
                            Text(
                              "Goals This Week:",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(5),
                        Row(
                          children: [
                            const Icon(
                              Icons.check_rounded,
                              color: AppColors.black,
                              size: 20,
                            ),
                            sizedBoxWithWidth(10),
                            Text(
                              "5 AM + PM routines",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(5),
                        Row(
                          children: [
                            const Icon(
                              Icons.check_rounded,
                              color: AppColors.black,
                              size: 20,
                            ),
                            sizedBoxWithWidth(10),
                            Text(
                              "3 Days with 3L water",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(5),
                        Row(
                          children: [
                            const Icon(
                              Icons.check_rounded,
                              color: AppColors.black,
                              size: 20,
                            ),
                            sizedBoxWithWidth(10),
                            Text(
                              "No sugar snacks for 2 days",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(20),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/trophy.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                            sizedBoxWithWidth(5),
                            Text(
                              "Milestone Unlocked:",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.lightyellow,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/stars_symbol.png",
                                height: 16,
                                width: 16,
                                fit: BoxFit.cover,
                              ),
                              sizedBoxWithWidth(5),
                              Text(
                                "“Hydration Hero” - 7 days of 3L intake",
                                maxLines: 2,
                                style: GoogleFonts.roboto(
                                  color: AppColors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/lock_logo.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                            sizedBoxWithWidth(5),
                            Text(
                              "Next:",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            sizedBoxWithWidth(5),
                            Expanded(
                              child: Text(
                                "“Consistency Queen” -14- day skincare streak",
                                maxLines: 2,
                                style: GoogleFonts.roboto(
                                  color: AppColors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  sizedBoxWithHeight(20),
                  Text(
                    "Routine Tracker (Product Use)",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sizedBoxWithHeight(10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AM:",
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        sizedBoxWithHeight(10),
                        Row(
                          children: [
                            Text(
                              "Cleanser",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              "assets/images/correct.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(5),
                        const Divider(color: AppColors.grey),
                        sizedBoxWithHeight(5),
                        Row(
                          children: [
                            Text(
                              "Serum",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              "assets/images/correct.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(5),
                        const Divider(color: AppColors.grey),
                        sizedBoxWithHeight(5),
                        Row(
                          children: [
                            Text(
                              "Sunscreen",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              "assets/images/correct.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(10),
                        Text(
                          "PM:",
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        sizedBoxWithHeight(10),
                        Row(
                          children: [
                            Text(
                              "Makeup Removed",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              "assets/images/correct.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(5),
                        Row(
                          children: [
                            Text(
                              "Moisturizer",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Image.asset(
                              "assets/images/correct.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(5),
                        const Divider(color: AppColors.grey),
                        sizedBoxWithHeight(5),
                        Row(
                          children: [
                            Text(
                              "Eye Cream",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.close,
                              color: AppColors.red,
                              size: 20,
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(10),
                        Align(
                          alignment: const Alignment(0, 0),
                          child: Text(
                            "Option to set reminders or log reactions",
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                              color: AppColors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxWithHeight(20),
                  Text(
                    "Smart Tips & Skincare Guidance",
                    style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sizedBoxWithHeight(10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/bulb.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                            sizedBoxWithWidth(5),
                            Expanded(
                              child: Text(
                                "Try a hyaluronic acid serum for hydration boost.",
                                maxLines: 2,
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(10),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/brain_logo.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                            sizedBoxWithWidth(5),
                            Expanded(
                              child: Text(
                                "AI Suggestion: Reduce sugar intake on breakout-prone days.",
                                maxLines: 2,
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(10),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/leaf_logo.png",
                              height: 16,
                              width: 16,
                              fit: BoxFit.cover,
                            ),
                            sizedBoxWithWidth(5),
                            Expanded(
                              child: Text(
                                "Natural Remedy: Green tea compress can reduce puffiness.",
                                maxLines: 2,
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(20),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(82),
                              color: AppColors.buttoncolor,
                            ),
                            child: Center(
                              child: Text(
                                "Save to My Tips",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        sizedBoxWithHeight(10),
                        Text(
                          "Optional link to your own blog/shop content",
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBoxWithHeight(20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Quick Actions",
                          style: GoogleFonts.roboto(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(82),
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.green,
                                Color.fromARGB(255, 133, 231, 111),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Log Today’s Routine",
                              style: GoogleFonts.roboto(
                                color: AppColors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
