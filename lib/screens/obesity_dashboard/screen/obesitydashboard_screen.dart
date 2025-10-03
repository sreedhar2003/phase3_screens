import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/obesity_dashboard/controller/obesitydashboard_controller.dart';
import 'package:phase3_screens/screens/obesity_dashboard/widgets/cardwithoutexpand.dart';
import 'package:phase3_screens/screens/obesity_dashboard/widgets/circularpercentage_card.dart';
import 'package:phase3_screens/screens/obesity_dashboard/widgets/graphwithoutpercentage_card.dart';
import 'package:phase3_screens/screens/obesity_dashboard/widgets/graphwithpercentage_card.dart'
    show GraphwithpercentageCard;
import 'package:phase3_screens/screens/obesity_dashboard/widgets/labs_card.dart';
import 'package:phase3_screens/screens/obesity_dashboard/widgets/showdialoggraph.dart';
import 'package:provider/provider.dart';

class ObesitydashboardScreen extends StatefulWidget {
  const ObesitydashboardScreen({super.key});

  @override
  State<ObesitydashboardScreen> createState() => _ObesitydashboardScreenState();
}

class _ObesitydashboardScreenState extends State<ObesitydashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ObesitydashboardController>();
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
                      "assets/images/obesity_logo.png",
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                    sizedBoxWithWidth(5),
                    Text(
                      "Obesity",
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
                      "Anthropometrics",
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
                            title: "Body Fat%",
                            value: "35",
                            unit: "",
                            percent: 0.80,
                            color: AppColors.orange,
                            statusIcon: "assets/images/borderline.png",
                            onGraphTap: () => showDialoggraph(
                              context,
                              "Body Fat%",
                              "35%",
                              "Moderate",
                              "assets/images/moderate.png",
                              AppColors.orange,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 35,
                                  minY: 0,
                                  groupsSpace: 5,
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
                                          toY: 25,
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
                                          toY: 18,
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
                                          toY: 20,
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
                                          toY: 15,
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
                                          toY: 20,
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
                                          toY: 18,
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
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Waist-to-Hip Ratio",
                      rating: "0.95 cm",
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
                      "Metabolic Labs",
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
                          child: LabsCard(
                            title: "HbA1c",
                            value: "6.1",
                            unit: "%",
                            status: "Normal",
                            statusColor: AppColors.green,
                            cardColor: AppColors.hba1ccard,
                            graph: () => showDialoggraph(
                              context,
                              "HbA1c",
                              "6.1 %",
                              "Normal",
                              "assets/images/normal.png",
                              AppColors.green,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 40,
                                  minY: 0,
                                  groupsSpace: 10,
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
                                          toY: 7,
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
                                          toY: 5,
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
                                          toY: 5,
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
                                          toY: 2,
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
                                          toY: 7,
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
                                          toY: 7,
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
                                          toY: 5,
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
                          child: LabsCard(
                            title: "Fasting Glucose",
                            value: "105",
                            unit: "mg/dL",
                            status: "Borderline",
                            statusColor: AppColors.orange,
                            cardColor: AppColors.white,
                            isHigh: true,
                            graph: () => showDialoggraph(
                              context,
                              "Insulin (Fasting)",
                              "105 mg/dL",
                              "Borderline",
                              "assets/images/borderline.png",
                              AppColors.red,
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
                                          toY: 100,
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
                                          toY: 100,
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
                                          toY: 100,
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
                                          toY: 100,
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
                      title: "Insulin (Fasting)",
                      rating: "18 µIU/mL",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Triglycerides",
                      rating: "170 mg/dL",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "HDL",
                      rating: "38 mg/dL",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: AppColors.hba1ccard,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Row (icon + status chip)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/bloodpressure.png",
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
                                      "Normal",
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Left side texts
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Blood Pressure",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  sizedBoxWithHeight(5),
                                  Text(
                                    "130/85 mmHg",
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),

                              const Spacer(),
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () => showDialoggraph(
                                    context,
                                    "Blood Pressure",
                                    "120/80 mmHg",
                                    "Moderate",
                                    "assets/images/moderate.png",
                                    AppColors.orange,
                                    Column(
                                      children: [
                                        // Legend
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 20.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 12,
                                                    height: 12,
                                                    color: const Color(
                                                      0xFF4CAF50,
                                                    ),
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
                                                    color: const Color(
                                                      0xFF9E9E9E,
                                                    ),
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
                                                alignment: BarChartAlignment
                                                    .spaceAround,
                                                maxY: 200,
                                                minY: 0,
                                                groupsSpace: 20,
                                                barTouchData: BarTouchData(
                                                  enabled: true,
                                                  touchTooltipData: BarTouchTooltipData(
                                                    tooltipBgColor:
                                                        Colors.grey[800],
                                                    getTooltipItem:
                                                        (
                                                          group,
                                                          groupIndex,
                                                          rod,
                                                          rodIndex,
                                                        ) {
                                                          String label =
                                                              rodIndex == 0
                                                              ? 'Systolic'
                                                              : 'Diastolic';
                                                          return BarTooltipItem(
                                                            '$label: ${rod.toY.round()}',
                                                            const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                  bottomTitles:
                                                      const AxisTitles(
                                                        sideTitles: SideTitles(
                                                          showTitles: false,
                                                        ),
                                                      ),
                                                  leftTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                      showTitles: true,
                                                      interval: 20,
                                                      getTitlesWidget:
                                                          (value, meta) {
                                                            return Text(
                                                              value
                                                                  .toInt()
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
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
                                                  getDrawingHorizontalLine:
                                                      (value) {
                                                        return FlLine(
                                                          color:
                                                              Colors.grey[300]!,
                                                          strokeWidth: 1,
                                                        );
                                                      },
                                                ),
                                                borderData: FlBorderData(
                                                  show: false,
                                                ),
                                                barGroups: [
                                                  BarChartGroupData(
                                                    x: 0,
                                                    barsSpace: 4,
                                                    barRods: [
                                                      BarChartRodData(
                                                        toY: 120,
                                                        color: const Color(
                                                          0xFF4CAF50,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                            ),
                                                      ),
                                                      BarChartRodData(
                                                        toY: 80,
                                                        color: const Color(
                                                          0xFF9E9E9E,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
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
                                                        color: const Color(
                                                          0xFF4CAF50,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                            ),
                                                      ),
                                                      BarChartRodData(
                                                        toY: 80,
                                                        color: const Color(
                                                          0xFF9E9E9E,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
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
                                                        color: const Color(
                                                          0xFF4CAF50,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                            ),
                                                      ),
                                                      BarChartRodData(
                                                        toY: 80,
                                                        color: const Color(
                                                          0xFF9E9E9E,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
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
                                                        color: const Color(
                                                          0xFF4CAF50,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                            ),
                                                      ),
                                                      BarChartRodData(
                                                        toY: 80,
                                                        color: const Color(
                                                          0xFF9E9E9E,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
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
                                                        color: AppColors.orange,
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                            ),
                                                      ),
                                                      BarChartRodData(
                                                        toY: 40,
                                                        color: AppColors.orange,
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
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
                                                        color: const Color(
                                                          0xFF4CAF50,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                            ),
                                                      ),
                                                      BarChartRodData(
                                                        toY: 70,
                                                        color: const Color(
                                                          0xFF9E9E9E,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
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
                                                        toY: 130,
                                                        color: const Color(
                                                          0xFF4CAF50,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                            ),
                                                      ),
                                                      BarChartRodData(
                                                        toY: 60,
                                                        color: const Color(
                                                          0xFF9E9E9E,
                                                        ),
                                                        width: 8,
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                    4.66,
                                                                  ),
                                                              topRight:
                                                                  Radius.circular(
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
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF00C853),
                                          Color(0xFF2E7D32),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        "View Graph",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                      "Lifestyle & Behavior",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Physical Activity (Steps/Mins)",
                      value: "5,000 steps / 60 mins",
                      percentage: 0.80,
                      status: "Normal",
                      statusColor: AppColors.green,
                      statusimage: "assets/images/normal.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Calorie Intake (Daily)",
                      value: "2,500 kcal",
                      percentage: 1.0,
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Macronutrient Distribution",
                      rating: "Carbs: 55%, Fat: 30%, Protein: 15%",
                      status: "Moderate",
                      statusColor: AppColors.yellow,
                      statusimage: "assets/images/moderate.png",
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
                      title: "Stress levels",
                      rating: "Moderate",
                      status: "Moderate",
                      statusColor: AppColors.yellow,
                      statusimage: "assets/images/moderate.png",
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(30),
              sizedBoxWithHeight(30),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Optional Behavioral Insights",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Cardwithoutexpand(
                      title: "Food Cravings Log",
                      rating: "Frequent (Sweets)",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    Cardwithoutexpand(
                      title: "Emotional Eating Triggers",
                      rating: "Stress, Boredom",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    Cardwithoutexpand(
                      title: "Sleep Apnea Symptoms",
                      rating: "Daytime Fatigue",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
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
