import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/hypertension_dashboard/controller/hypertensiondashboard_controller.dart';
import 'package:phase3_screens/screens/hypertension_dashboard/widgets/graphwithoutpercentage_card.dart';
import 'package:phase3_screens/screens/hypertension_dashboard/widgets/graphwithpercentage_card.dart';
import 'package:phase3_screens/screens/hypertension_dashboard/widgets/circularpercentage_card.dart';
import 'package:phase3_screens/screens/hypertension_dashboard/widgets/showdialoggraph.dart';
import 'package:phase3_screens/screens/hypertension_dashboard/widgets/vitals_card.dart';
import 'package:provider/provider.dart';

class HypertensiondashboardScreen extends StatefulWidget {
  const HypertensiondashboardScreen({super.key});

  @override
  State<HypertensiondashboardScreen> createState() =>
      _HypertensiondashboardScreenState();
}

class _HypertensiondashboardScreenState
    extends State<HypertensiondashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HypertensiondashboardController>();
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
                      "assets/images/hypertension.png",
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                    sizedBoxWithWidth(5),
                    Text(
                      "Hypertension",
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
              sizedBoxWithHeight(30),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vitals & Clinical Metrics",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    VitalsCard(
                      title: "Systolic / Diastolic BP",
                      value: "130/85",
                      unit: " mmHg",
                      status: "Normal",
                      statusColor: AppColors.green,
                      iconPath: "assets/images/bloodpressure.png",
                      onGraphTap: () => showDialoggraph(
                        context,
                        "Systolic / Diastolic BP",
                        "130/85 mmHg",
                        "Normal",
                        "assets/images/normal.png",
                        AppColors.green,
                        Column(
                          children: [
                            // Legend
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        color: const Color(0xFF4CAF50),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Systolic',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 30),
                                  Row(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        color: const Color(0xFF9E9E9E),
                                      ),
                                      const SizedBox(width: 8),
                                      const Text(
                                        'Diastolic',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Chart
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: BarChart(
                                  BarChartData(
                                    alignment: BarChartAlignment.spaceAround,
                                    maxY: 200,
                                    minY: 0,
                                    groupsSpace: 30,
                                    barTouchData: BarTouchData(
                                      enabled: true,
                                      touchTooltipData: BarTouchTooltipData(
                                        tooltipBgColor: Colors.grey[800],
                                        getTooltipItem:
                                            (group, groupIndex, rod, rodIndex) {
                                              String label = rodIndex == 0
                                                  ? 'Systolic'
                                                  : 'Diastolic';
                                              return BarTooltipItem(
                                                '$label: ${rod.toY.round()}',
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
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      topTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      bottomTitles: const AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      leftTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          interval: 50,
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
                                      horizontalInterval: 50,
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
                                        barsSpace: 4,
                                        barRods: [
                                          BarChartRodData(
                                            toY: 120,
                                            color: const Color(0xFF4CAF50),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                          BarChartRodData(
                                            toY: 80,
                                            color: const Color(0xFF9E9E9E),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                      BarChartGroupData(
                                        x: 1,
                                        barsSpace: 4,
                                        barRods: [
                                          BarChartRodData(
                                            toY: 120,
                                            color: const Color(0xFF4CAF50),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                          BarChartRodData(
                                            toY: 80,
                                            color: const Color(0xFF9E9E9E),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                      BarChartGroupData(
                                        x: 2,
                                        barsSpace: 4,
                                        barRods: [
                                          BarChartRodData(
                                            toY: 120,
                                            color: const Color(0xFF4CAF50),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                          BarChartRodData(
                                            toY: 80,
                                            color: const Color(0xFF9E9E9E),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                      BarChartGroupData(
                                        x: 3,
                                        barsSpace: 4,
                                        barRods: [
                                          BarChartRodData(
                                            toY: 120,
                                            color: const Color(0xFF4CAF50),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                          BarChartRodData(
                                            toY: 80,
                                            color: const Color(0xFF9E9E9E),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                      BarChartGroupData(
                                        x: 4,
                                        barsSpace: 4,
                                        barRods: [
                                          BarChartRodData(
                                            toY: 160,
                                            color: AppColors.red,
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                          BarChartRodData(
                                            toY: 40,
                                            color: AppColors.red,
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                      BarChartGroupData(
                                        x: 5,
                                        barsSpace: 4,
                                        barRods: [
                                          BarChartRodData(
                                            toY: 120,
                                            color: AppColors.green,
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                          BarChartRodData(
                                            toY: 80,
                                            color: const Color(0xFF9E9E9E),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                      BarChartGroupData(
                                        x: 6,
                                        barsSpace: 4,
                                        barRods: [
                                          BarChartRodData(
                                            toY: 140,
                                            color: const Color(0xFF4CAF50),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                          BarChartRodData(
                                            toY: 80,
                                            color: const Color(0xFF9E9E9E),
                                            width: 8,
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.66,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.66,
                                                  ),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    VitalsCard(
                      title: "Heart Rate (Resting)",
                      value: "72",
                      unit: "bpm",
                      status: "Normal",
                      statusColor: AppColors.green,
                      iconPath: "assets/images/heartrate_logo.png",
                      onGraphTap: () => showDialoggraph(
                        context,
                        "Heart Rate (Resting)",
                        "72 bpm",
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
                                    toY: 70,
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
                                    toY: 70,
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
                                    toY: 70,
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
                                    toY: 70,
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
                                    toY: 70,
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
                                    toY: 70,
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
                                    toY: 70,
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
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "BP Variability (Weekly)",
                      rating: "Low",
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Pulse Pressure",
                      rating: "45 mmHg ",
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Orthostatic BP",
                      rating: "Normal",
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
                      "Physical Measures",
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
                                          toY: 70,
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
                                          toY: 70,
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
                                          toY: 70,
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
                                          toY: 70,
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
                                          toY: 70,
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
                                          toY: 70,
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
                                          toY: 70,
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
                        sizedBoxWithWidth(10),
                        Expanded(
                          child: CircularpercentageCard(
                            title: "BMI",
                            value: "28.3",
                            unit: "",
                            percent: 0.80,
                            color: AppColors.red,
                            statusIcon: "assets/images/high.png",
                            onGraphTap: () => showDialoggraph(
                              context,
                              "BMI",
                              "28.3",
                              "High",
                              "assets/images/high.png",
                              AppColors.red,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 50,
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
                                          toY: 20,
                                          color: AppColors.red,
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
                                          toY: 20,
                                          color: AppColors.red,
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
                                          toY: 20,
                                          color: AppColors.red,
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
                                          toY: 20,
                                          color: AppColors.red,
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
                                          toY: 20,
                                          color: AppColors.red,
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
                                          toY: 20,
                                          color: AppColors.red,
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
                                          toY: 20,
                                          color: AppColors.red,
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
                      "Lifestyle Factors",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    GraphwithpercentageCard(
                      title: "Sleep Duration & Quality",
                      value: "7.5 hrs (Score: 82)",
                      percentage: 0.80,
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(5),
                    GraphwithoutpercentageCard(
                      title: "Stress levels",
                      rating: "Moderate",
                      status: "Moderate",
                      statusColor: AppColors.yellow,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(5),
                    GraphwithpercentageCard(
                      title: "Sodium Intake (Daily)",
                      value: "2,800 mg / 2,300 mg",
                      percentage: 100,
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(5),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                provider.isExpanded = !provider.isExpanded;
                              });
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Alcohol Consumption (Weekly)",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  provider.isExpanded
                                      ? "view graph"
                                      : "View graph",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                sizedBoxWithWidth(5),
                                Icon(
                                  provider.isExpanded
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: AppColors.black,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                          sizedBoxWithHeight(6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "5 units",
                                maxLines: 3,
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                "assets/images/high.png",
                                height: 16.h,
                                width: 16.w,
                              ),
                              sizedBoxWithWidth(4),
                              Text(
                                "High",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                          sizedBoxWithHeight(5),
                          LinearProgressIndicator(
                            value: 0.80,
                            minHeight: 8.h,
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.red,
                            backgroundColor: Colors.grey.shade200,
                          ),
                          sizedBoxWithHeight(10),

                          if (provider.isExpanded) ...[
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
                                          border: Border.all(
                                            color: AppColors.black,
                                          ),
                                          color: AppColors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                    "Graph/Details for Alcohol Consumption (Weekly)",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          Text(
                            "Choose the type of alcohol",
                            style: GoogleFonts.roboto(
                              color: AppColors.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxWithHeight(5),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                30,
                              ), // rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: provider.selectedoptions,
                                hint: Text(
                                  "Select",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                isExpanded: true,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.black,
                                ),
                                items: provider.alcoholoptions.map((
                                  String value,
                                ) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    provider.selectedoptions = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
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
                      " Lifestyle & Diet",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    GraphwithpercentageCard(
                      title: "Physical Activity (Mins/Week)",
                      value: "120 mins / 150 mins",
                      percentage: 0.80,
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(5),
                    GraphwithpercentageCard(
                      title: "Fiber Intake (Daily)",
                      value: "20g / 30g (Target)",
                      percentage: 0.80,
                      status: "Moderate",
                      statusColor: AppColors.yellow,
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
                      "Medication & Adherence",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: AppColors.lightorange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize:
                            MainAxisSize.min, // prevents infinite height
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/medicine&adherence.png",
                                height: 25,
                                width: 25,
                                fit: BoxFit.contain,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                    sizedBoxWithWidth(5),
                                    Text(
                                      "Taken",
                                      style: GoogleFonts.roboto(
                                        fontSize: 11,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          sizedBoxWithHeight(10),

                          Text(
                            "Antihypertensive Meds",
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          sizedBoxWithHeight(5),
                          Text(
                            "Lisinopril 10mg (Daily)",
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    Container(
                      // height: 89.h,
                      // width: 343.w,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "BP Log vs. Med Intake",
                                style: GoogleFonts.roboto(
                                  color: AppColors.grey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          sizedBoxWithHeight(10),
                          Row(
                            children: [
                              Text(
                                "Stable after meds",
                                style: GoogleFonts.roboto(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                "assets/images/normal.png",
                                height: 16.h,
                                width: 16.w,
                              ),
                              sizedBoxWithWidth(4),
                              Text(
                                "Taken",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    sizedBoxWithHeight(5),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 99.h,
                      width: 343.w,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Missed Dose Adherence",
                            style: GoogleFonts.roboto(
                              color: AppColors.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxWithHeight(6),
                          Text(
                            "98% Adherence",
                            style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          sizedBoxWithHeight(5),
                          LinearProgressIndicator(
                            value: 0.95,
                            minHeight: 8.h,
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors.red,
                            backgroundColor: Colors.grey.shade200,
                          ),
                        ],
                      ),
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
