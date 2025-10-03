import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/cholesterol_dashboard/controller/cholesteroldashboard_controller.dart';
import 'package:phase3_screens/screens/cholesterol_dashboard/widgets/Main_card.dart';
import 'package:phase3_screens/screens/cholesterol_dashboard/widgets/circularpercentage_card.dart';

import 'package:phase3_screens/screens/cholesterol_dashboard/widgets/graphwithoutpercentage_card.dart';

import 'package:phase3_screens/screens/cholesterol_dashboard/widgets/graphwithpercentage_card.dart';
import 'package:phase3_screens/screens/cholesterol_dashboard/widgets/showdialog_graph.dart';

import 'package:phase3_screens/screens/cholesterol_dashboard/widgets/simple_card.dart';
import 'package:provider/provider.dart';

class CholesteroldashboardScreen extends StatefulWidget {
  const CholesteroldashboardScreen({super.key});

  @override
  State<CholesteroldashboardScreen> createState() =>
      _CholesteroldashboardScreenState();
}

class _CholesteroldashboardScreenState
    extends State<CholesteroldashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CholesteroldashboardController>();
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
            "Dashboard",
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
          padding: EdgeInsetsGeometry.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/cholesterol.png",
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                    sizedBoxWithWidth(5),
                    Text(
                      "Cholesterol",
                      style: GoogleFonts.roboto(
                        color: AppColors.green,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/crown.png",
                      height: 20,
                      width: 20,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(10),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lipid Profile",
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
                          child: MainCard(
                            title: "Total Cholesterol",
                            value: "190",
                            unit: "mg/dL",
                            status: "Moderate",
                            statusColor: AppColors.orange,
                            cardColor: AppColors.white,
                            isHigh: true,
                            graph: () => showDialoggraph(
                              context,
                              "Total Cholesterol",
                              "190 mg/dL",
                              "Moderate",
                              "assets/images/moderate.png",
                              AppColors.orange,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 200,
                                  minY: 0,
                                  groupsSpace: 40,
                                  barTouchData: BarTouchData(
                                    enabled: true,
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey[800],
                                      getTooltipItem:
                                          (group, groupIndex, rod, rodIndex) {
                                            return BarTooltipItem(
                                              '${rod.toY.round()}',
                                              const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 40,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            value.toInt().toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: false,
                                    horizontalInterval: 10,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: Colors.grey[300]!,
                                        strokeWidth: 1,
                                      );
                                    },
                                  ),
                                  borderData: FlBorderData(show: false),
                                  barGroups: [
                                    BarChartGroupData(
                                      x: 0,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 200,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 1,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 150,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 2,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 150,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 3,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 120,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 4,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 180,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 5,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 180,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 6,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 160,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(10),
                        Expanded(
                          child: MainCard(
                            title: "Triglycerides",
                            value: "140",
                            unit: "mg/dL",
                            status: "Moderate",
                            statusColor: AppColors.orange,
                            cardColor: AppColors.white,
                            isHigh: true,
                            graph: () => showDialoggraph(
                              context,
                              "Triglycerides",
                              "140 mg/dL",
                              "Moderate",
                              "assets/images/moderate.png",
                              AppColors.orange,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 200,
                                  minY: 0,
                                  groupsSpace: 40,
                                  barTouchData: BarTouchData(
                                    enabled: true,
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey[800],
                                      getTooltipItem:
                                          (group, groupIndex, rod, rodIndex) {
                                            return BarTooltipItem(
                                              '${rod.toY.round()}',
                                              const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 40,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            value.toInt().toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: false,
                                    horizontalInterval: 10,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: Colors.grey[300]!,
                                        strokeWidth: 1,
                                      );
                                    },
                                  ),
                                  borderData: FlBorderData(show: false),
                                  barGroups: [
                                    BarChartGroupData(
                                      x: 0,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 140,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 1,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 120,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 2,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 80,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 3,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 100,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 4,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 120,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 5,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 120,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 6,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 110,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "LDL-C",
                      rating: "120 mg/dL",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "HDL-C",
                      rating: "55 mg/dL",
                      status: "High",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Non-HDL Cholesterol",
                      rating: "135 mg/dL",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "LDL:HDL Ratio",
                      rating: "2.18",
                      status: "Moderate",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/moderate.png",
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(30),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Metabolic Health",
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
                          child: MainCard(
                            title: "HbA1c",
                            value: "5.6",
                            unit: "%",
                            status: "Normal",
                            statusColor: AppColors.green,
                            cardColor: AppColors.hba1ccard,
                            graph: () => showDialoggraph(
                              context,
                              "HbA1c",
                              "5.6 %",
                              "Normal",
                              "assets/images/normal.png",
                              AppColors.green,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 40,
                                  minY: 0,
                                  groupsSpace: 20,
                                  barTouchData: BarTouchData(
                                    enabled: true,
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey[800],
                                      getTooltipItem:
                                          (group, groupIndex, rod, rodIndex) {
                                            return BarTooltipItem(
                                              '${rod.toY.round()}',
                                              const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 10,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            value.toInt().toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: false,
                                    horizontalInterval: 10,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: Colors.grey[300]!,
                                        strokeWidth: 1,
                                      );
                                    },
                                  ),
                                  borderData: FlBorderData(show: false),
                                  barGroups: [
                                    BarChartGroupData(
                                      x: 0,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 5,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 1,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 3,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 2,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 5,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 3,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 3,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 4,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 6,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 5,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 5,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 6,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 5,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(10),
                        Expanded(
                          child: MainCard(
                            title: "Fasting Blood Glucose",
                            value: "98",
                            unit: "mg/dL",
                            status: "Borderline",
                            statusColor: AppColors.orange,
                            cardColor: AppColors.white,
                            isHigh: true,
                            graph: () => showDialoggraph(
                              context,
                              "Fasting Blood Glucose",
                              "98 mg/dL",
                              "Borderline",
                              "assets/images/borderline.png",
                              AppColors.orange,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 100,
                                  minY: 0,
                                  groupsSpace: 20,
                                  barTouchData: BarTouchData(
                                    enabled: true,
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey[800],
                                      getTooltipItem:
                                          (group, groupIndex, rod, rodIndex) {
                                            return BarTooltipItem(
                                              '${rod.toY.round()}',
                                              const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 20,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            value.toInt().toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: false,
                                    horizontalInterval: 10,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: Colors.grey[300]!,
                                        strokeWidth: 1,
                                      );
                                    },
                                  ),
                                  borderData: FlBorderData(show: false),
                                  barGroups: [
                                    BarChartGroupData(
                                      x: 0,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 100,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 1,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 70,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 2,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 70,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 3,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 50,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 4,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 90,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 5,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 90,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 6,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 70,
                                          color: AppColors.orange,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Liver Enzymes (ALT/AST)",
                      rating: "25 / 20 U/L",
                      status: "Moderate",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "C-reactive protein (CRP)",
                      rating: "1.5 mg/L",
                      status: "Moderate",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/moderate.png",
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(30),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Physical Metrics",
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
                            onGraphTap: () => showDialoggraph(
                              context,
                              "Weight",
                              "70 kg",
                              "Normal",
                              "assets/images/normal.png",
                              AppColors.green,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 100,
                                  minY: 0,
                                  groupsSpace: 20,
                                  barTouchData: BarTouchData(
                                    enabled: true,
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey[800],
                                      getTooltipItem:
                                          (group, groupIndex, rod, rodIndex) {
                                            return BarTooltipItem(
                                              '${rod.toY.round()}',
                                              const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 20,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            value.toInt().toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: false,
                                    horizontalInterval: 10,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: Colors.grey[300]!,
                                        strokeWidth: 1,
                                      );
                                    },
                                  ),
                                  borderData: FlBorderData(show: false),
                                  barGroups: [
                                    BarChartGroupData(
                                      x: 0,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 60,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 1,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 60,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 2,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 60,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 3,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 60,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 4,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 60,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 5,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 60,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 6,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 60,
                                          color: AppColors.green,
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(10),
                        Expanded(
                          child: CircularpercentageCard(
                            title: "Body Fat%",
                            value: "35",
                            unit: "%",
                            percent: 0.35,
                            color: AppColors.orange,
                            statusIcon: "assets/images/borderline.png",
                            onGraphTap: () => showDialoggraph(
                              context,
                              "Body Fat%",
                              "35 %",
                              "Normal",
                              "assets/images/normal.png",
                              AppColors.green,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 35,
                                  minY: 0,
                                  groupsSpace: 20,
                                  barTouchData: BarTouchData(
                                    enabled: true,
                                    touchTooltipData: BarTouchTooltipData(
                                      tooltipBgColor: Colors.grey[800],
                                      getTooltipItem:
                                          (group, groupIndex, rod, rodIndex) {
                                            return BarTooltipItem(
                                              '${rod.toY.round()}',
                                              const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                  titlesData: FlTitlesData(
                                    show: true,
                                    rightTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    topTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: const AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 5,
                                        getTitlesWidget: (value, meta) {
                                          return Text(
                                            value.toInt().toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  gridData: FlGridData(
                                    show: true,
                                    drawHorizontalLine: true,
                                    drawVerticalLine: false,
                                    horizontalInterval: 10,
                                    getDrawingHorizontalLine: (value) {
                                      return FlLine(
                                        color: Colors.grey[300]!,
                                        strokeWidth: 1,
                                      );
                                    },
                                  ),
                                  borderData: FlBorderData(show: false),
                                  barGroups: [
                                    BarChartGroupData(
                                      x: 0,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 22,
                                          color: const Color(0xFF4CAF50),
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 1,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 26,
                                          color: const Color(0xFF4CAF50),
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 2,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 16,
                                          color: const Color(0xFF4CAF50),
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 3,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 24,
                                          color: const Color(0xFF4CAF50),
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 4,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 14,
                                          color: const Color(0xFF4CAF50),
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 5,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 19,
                                          color: const Color(0xFF4CAF50),
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    BarChartGroupData(
                                      x: 6,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 17,
                                          color: const Color(0xFF4CAF50),
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "BMI",
                      rating: "23.5",
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Waist Circumference",
                      rating: "85 cm",
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(30),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lifestyle & Diet",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Physical Activity (Mins/Week)",
                      value: "120 mins / 150 mins",
                      percentage: 0.80,
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(5),
                    GraphwithoutpercentageCard(
                      title: "Fiber Intake (Daily)",
                      rating: "20g / 30g (Target)",
                      status: "Moderate",
                      statusColor: AppColors.yellow,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Saturated Fat Intake (Daily)",
                      value: "25g / 20g (Target)",
                      percentage: 1,
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    SimpleCard(
                      title: "Alcohol & Smoking Habits",
                      rating: "Occasional Alcohol, Non-smoker",
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(30),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Medication Monitoring",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    SimpleCard(
                      title: "Statin Adherence Log",
                      rating: "95% Adherence",
                    ),
                    sizedBoxWithHeight(10),
                    SimpleCard(
                      title: "Side Effect Tracking",
                      rating: "No new side effects",
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(20),
            ],
          ),
        ),
      ),
    );
  }
}
