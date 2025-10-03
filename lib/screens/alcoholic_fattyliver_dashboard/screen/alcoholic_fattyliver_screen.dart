import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/alcoholic_fattyliver_dashboard/controller/alcoholic_fattyliver_controller.dart';
import 'package:phase3_screens/screens/alcoholic_fattyliver_dashboard/widgets/Main_card.dart';
import 'package:phase3_screens/screens/alcoholic_fattyliver_dashboard/widgets/circularpercentage_card.dart';
import 'package:phase3_screens/screens/alcoholic_fattyliver_dashboard/widgets/graphwithoutpercentage_card.dart';
import 'package:phase3_screens/screens/alcoholic_fattyliver_dashboard/widgets/graphwithpercentage_card.dart';
import 'package:phase3_screens/screens/alcoholic_fattyliver_dashboard/widgets/showdialog_graph.dart';
import 'package:provider/provider.dart';

class AlcoholicFattyliverScreen extends StatefulWidget {
  const AlcoholicFattyliverScreen({super.key});

  @override
  State<AlcoholicFattyliverScreen> createState() =>
      _AlcoholicFattyliverScreenState();
}

class _AlcoholicFattyliverScreenState extends State<AlcoholicFattyliverScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AlcoholicFattyliverController>();
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
                      "assets/images/fattyliver_logo.png",
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                    sizedBoxWithWidth(5),
                    Text(
                      "Fatty Liver",
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
              sizedBoxWithHeight(5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Alcoholic Fatty Liver Disease",
                  style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              sizedBoxWithHeight(5),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Body & Metabolic Health",
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
                            title: "HbA1c / Fasting Glucose",
                            value: "6.2%",
                            unit: " /108 mg/dL",
                            status: "High",
                            statusColor: AppColors.red,
                            cardColor: AppColors.white,
                            isHigh: true,
                            graph: () => showDialoggraph(
                              context,
                              "HbA1c / Fasting Glucose",
                              "6.2% /108 mg/dL",
                              "High",
                              "assets/images/high.png",
                              AppColors.red,
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: Colors.red,
                                      ),
                                      sizedBoxWithWidth(5),
                                      Text(
                                        "HbA1c",
                                        style: GoogleFonts.roboto(
                                          color: AppColors.black,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: AppColors.grey,
                                      ),
                                      sizedBoxWithWidth(5),
                                      Text(
                                        "Fasting Glucose",
                                        style: GoogleFonts.roboto(
                                          color: AppColors.black,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: BarChart(
                                      BarChartData(
                                        maxY: 120,
                                        barGroups: List.generate(
                                          provider.data.length,
                                          (index) => BarChartGroupData(
                                            x: index,
                                            barRods: [
                                              BarChartRodData(
                                                toY:
                                                    provider.data[index][0] +
                                                    provider.data[index][1],
                                                rodStackItems: [
                                                  BarChartRodStackItem(
                                                    0,
                                                    provider.data[index][0],
                                                    AppColors.grey,
                                                  ),
                                                  BarChartRodStackItem(
                                                    provider.data[index][0],
                                                    provider.data[index][0] +
                                                        provider.data[index][1],
                                                    AppColors.red,
                                                  ),
                                                ],
                                                width: 20,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    4.99,
                                                  ),
                                                  topRight: Radius.circular(
                                                    4.99,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        titlesData: FlTitlesData(
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              interval: 20,
                                              showTitles: true,
                                              reservedSize: 40,
                                            ),
                                          ),
                                          rightTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: false,
                                            ),
                                          ),
                                          topTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: false,
                                            ),
                                          ),
                                          bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) {
                                                switch (value.toInt()) {
                                                  case 0:
                                                    return const Text("M");
                                                  case 1:
                                                    return const Text("T");
                                                  case 2:
                                                    return const Text("W");
                                                  case 3:
                                                    return const Text("T");
                                                  case 4:
                                                    return const Text("F");
                                                  case 5:
                                                    return const Text("S");
                                                  case 6:
                                                    return const Text("S");
                                                }
                                                return const Text("");
                                              },
                                            ),
                                          ),
                                        ),
                                        gridData: FlGridData(show: false),
                                        borderData: FlBorderData(show: false),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              300,
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(10),
                        Expanded(
                          child: MainCard(
                            title: "Triglycerides",
                            value: "220",
                            unit: " mg/dL (High)",
                            status: "High",
                            statusColor: AppColors.red,
                            cardColor: AppColors.white,
                            isHigh: true,
                            graph: () => showDialoggraph(
                              context,
                              "Triglycerides",
                              "220 mg/dL (High)",
                              "High",
                              "assets/images/high.png",
                              AppColors.red,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 250,
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
                                          toY: 220,
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
                                          toY: 250,
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
                                          toY: 220,
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
                                          toY: 250,
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
                                          toY: 250,
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
                                          toY: 220,
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
                                          toY: 250,
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
                              200,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CircularpercentageCard(
                            title: "Weight",
                            value: "84.5",
                            unit: "kg",
                            percent: 0.84, // 70 out of 100
                            color: AppColors.orange,
                            statusIcon: "assets/images/moderate.png",
                            onGraphTap: () => showDialoggraph(
                              context,
                              "Weight",
                              "84.5 kg",
                              "Moderate",
                              "assets/images/moderate.png",
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
                                    drawHorizontalLine: false,
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
                                      x: 1,
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
                                      x: 4,
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
                                      x: 5,
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
                                      x: 6,
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
                                  ],
                                ),
                              ),
                              200,
                            ),
                          ),
                        ),
                        sizedBoxWithWidth(10),
                        Expanded(
                          child: CircularpercentageCard(
                            title: "Waist Circumference",
                            value: "95",
                            unit: "cm",
                            percent: 0.95,
                            color: AppColors.orange,
                            statusIcon: "assets/images/moderate.png",
                            onGraphTap: () => showDialoggraph(
                              context,
                              "Waist Circumference",
                              "95 cm",
                              "High",
                              "assets/images/high.png",
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
                                          toY: 80,
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
                                          toY: 80,
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
                                          toY: 80,
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
                                          toY: 80,
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
                                          toY: 80,
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
                                          toY: 80,
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
                                          toY: 80,
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
                              200,
                            ),
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "BMI",
                      rating: "27.3 (Overweight)",
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
                      "Liver Health Panel",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "ALT (Alanine Aminotransferase)",
                      rating: "78 U/L",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "AST (Aspartate Aminotransferase)",
                      rating: "165 U/L",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "AST : ALT Ratio",
                      rating: "2.1 : 1",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "GGT (Gamma GT)",
                      rating: "110 U/L",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Fibroscan Result",
                      rating: "F2 (Moderate Fibrosis) Estimated",
                      status: "Moderate",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.redcontainer,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: AppColors.yellow,
                            size: 20,
                          ),
                          sizedBoxWithWidth(5),
                          Expanded(
                            child: Text(
                              "Liver enzymes elevated — suggest reducing alcohol intake",
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                color: AppColors.red,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
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
                      "Alcohol Use Overview",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
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
                                  "Weekly Drinks Consumed",
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
                                "Spirit - 18 drinks this week",
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
                                    "Graph/Details for Weekly Drinks Consumed",
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
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Alcohol-Free Days",
                      rating: "2 alcohol-free days this week",
                      status: "Moderate",
                      statusColor: AppColors.yellow,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Binge Episodes (3+ drinks/day)",
                      rating: "2 episodes this week",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.redcontainer,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: AppColors.yellow,
                            size: 20,
                          ),
                          sizedBoxWithWidth(5),
                          Expanded(
                            child: Text(
                              "Above recommended safe limits (14/week for men, 7/week for women)",
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                color: AppColors.red,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.greencontainer,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/normal.png",
                            height: 13,
                            width: 13,
                            fit: BoxFit.contain,
                          ),
                          sizedBoxWithWidth(5),
                          Expanded(
                            child: Text(
                              "3-day no alcohol streak – great job!",
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                color: AppColors.green,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
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
                      "Lifestyle Factors",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Sleep Duration & Quality",
                      rating: "6h 20m, fair quality",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),

                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Physical Activity (Steps/Day)",
                      value: "5,800 steps/day avg",
                      percentage: 0.80,
                      status: "Moderate",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Mood Check-in",
                      rating: "Neutral",
                      status: "Moderate",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Diet Quality (Saturated Fat/Sugar)",
                      value: "High Saturated Fat Score",
                      percentage: 0.80,
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
                      "Alerts & Recommendations",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.redcontainer,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/moderate.png",
                            height: 13,
                            width: 13,
                            fit: BoxFit.contain,
                          ),
                          sizedBoxWithWidth(5),
                          Expanded(
                            child: Text(
                              "AST:ALT ratio >2 – monitor for liver stress due to alcohol",
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                color: AppColors.red,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.redcontainer,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/moderate.png",
                            height: 13,
                            width: 13,
                            fit: BoxFit.contain,
                          ),
                          sizedBoxWithWidth(5),
                          Expanded(
                            child: Text(
                              "GGT high – consistent with alcohol-related liver impact",
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                color: AppColors.red,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.orangecontainer,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: AppColors.yellow,
                            size: 20,
                          ),
                          sizedBoxWithWidth(5),
                          Expanded(
                            child: Text(
                              "Try to include 3 alcohol-free days per week",
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                color: AppColors.orange,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.greencontainer,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/normal.png",
                            height: 13,
                            width: 13,
                            fit: BoxFit.contain,
                          ),
                          sizedBoxWithWidth(5),
                          Expanded(
                            child: Text(
                              "GGT high – consistent with alcohol-related liver impact",
                              maxLines: 2,
                              style: GoogleFonts.roboto(
                                color: AppColors.green,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(50),
            ],
          ),
        ),
      ),
    );
  }
}
