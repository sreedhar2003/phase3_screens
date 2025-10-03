import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/diabetes_dashboard/controller/diabetesdashboard_controller.dart';
import 'package:phase3_screens/screens/diabetes_dashboard/widgets/graphwithoutpercentage_card.dart';
import 'package:phase3_screens/screens/diabetes_dashboard/widgets/graphwithpercentage_card.dart';
import 'package:phase3_screens/screens/diabetes_dashboard/widgets/labmeterics_card.dart';
import 'package:phase3_screens/screens/diabetes_dashboard/widgets/circularpercentage_card.dart';
import 'package:phase3_screens/screens/diabetes_dashboard/widgets/showdialog_graph.dart';
import 'package:phase3_screens/screens/diabetes_dashboard/widgets/vitals_card.dart';
import 'package:provider/provider.dart';

class DiabetesdashboardScreen extends StatefulWidget {
  const DiabetesdashboardScreen({super.key});

  @override
  State<DiabetesdashboardScreen> createState() =>
      _DiabetesdashboardScreenState();
}

class _DiabetesdashboardScreenState extends State<DiabetesdashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DiabetesdashboardController>();
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
                      "assets/images/glucosemeter.png",
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                    sizedBoxWithWidth(5),
                    Text(
                      "Diabetes",
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
                      "Essential Lab metrics",
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
                          child: LabmetericsCard(
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
                                          toY: 15,
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
                                          toY: 12,
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
                                          toY: 18,
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
                                          toY: 8,
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
                                      x: 5,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 25,
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
                                          toY: 20,
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
                          child: LabmetericsCard(
                            title: "Insulin (Fasting)",
                            value: "12",
                            unit: "µIU/mL",
                            status: "High",
                            statusColor: AppColors.red,
                            cardColor: AppColors.white,
                            isHigh: true,
                            graph: () => showDialoggraph(
                              context,
                              "Insulin (Fasting)",
                              "12 µIU/mL",
                              "High",
                              "assets/images/high.png",
                              AppColors.red,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 20,
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
                                        interval: 4,
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
                                          toY: 8,
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
                                          toY: 4,
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
                                          toY: 8,
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
                                          toY: 12,
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
                                      x: 5,
                                      barRods: [
                                        BarChartRodData(
                                          toY: 10,
                                          color: const Color(0xFFE53E3E),
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
                                          toY: 9,
                                          color: const Color(0xFFE53E3E),
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
                      title: "Fasting Blood Glucose",
                      rating: "98 mg/dL",
                      status: "Borderline",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/borderline.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Postprandial Blood Glucose ",
                      rating: "145 mg/dL",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
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
                      "Anthropometrics / Lifestyle",
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
                      "Vitals",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    VitalCard(
                      title: "Blood Pressure",
                      value: "120/80",
                      unit: "mmHg",
                      status: "Normal",
                      statusColor: AppColors.green,
                      iconPath: "assets/images/bloodpressure.png",
                      onGraphTap: () => showDialoggraph(
                        context,
                        "Blood Pressure",
                        "120/80 mmHg",
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
                                            toY: 125,
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
                                            toY: 85,
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
                                            toY: 118,
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
                                            toY: 78,
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
                                            toY: 122,
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
                                            toY: 82,
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
                                            color: const Color(0xFFE53E3E),
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
                                            toY: 95,
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
                                        x: 5,
                                        barsSpace: 4,
                                        barRods: [
                                          BarChartRodData(
                                            toY: 115,
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
                                            toY: 75,
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
                                            toY: 128,
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
                                            toY: 88,
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
                    VitalCard(
                      title: "Heart Rate",
                      value: "68",
                      unit: "bpm",
                      status: "Normal",
                      statusColor: AppColors.green,
                      iconPath: "assets/images/heartrate_logo.png",
                      onGraphTap: () => showDialoggraph(
                        context,
                        "Heart Rate",
                        "68 bpm",
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
                                    toY: 25,
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
                                    toY: 28,
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
                                    toY: 15,
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
                                x: 4,
                                barRods: [
                                  BarChartRodData(
                                    toY: 12,
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
                                    toY: 18,
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
                                    toY: 20,
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
                      "Behavior & Lifestyle Tracking",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Physical Activity",
                      value: "8,500 / 10,000 steps",
                      percentage: 0.80,
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Sleep Duration & Quality",
                      value: "7.5 hrs (Score: 82)",
                      percentage: 0.80,
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Diet Tracking (Carbs/Sugar)",
                      rating: "150g Carbs / 25g Sugar",
                      status: "Moderate",
                      statusColor: AppColors.yellow,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Stress levels",
                      rating: "Moderate",
                      status: "Moderate",
                      statusColor: AppColors.yellow,
                      statusimage: "assets/images/moderate.png",
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
