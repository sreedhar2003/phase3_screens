import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';
import 'package:phase3_screens/screens/nonalcoholic_fattyliver_dashboard/controller/nonalcoholic_fattyliver_controller.dart';
import 'package:phase3_screens/screens/nonalcoholic_fattyliver_dashboard/widgets/Main_card.dart';
import 'package:phase3_screens/screens/nonalcoholic_fattyliver_dashboard/widgets/graphwithoutpercentage_card.dart';
import 'package:phase3_screens/screens/nonalcoholic_fattyliver_dashboard/widgets/graphwithpercentage_card.dart';
import 'package:phase3_screens/screens/nonalcoholic_fattyliver_dashboard/widgets/showdialog_graph.dart';
import 'package:provider/provider.dart';

class NonalcoholicFattyliverScreen extends StatefulWidget {
  const NonalcoholicFattyliverScreen({super.key});

  @override
  State<NonalcoholicFattyliverScreen> createState() =>
      _NonalcoholicFattyliverScreenState();
}

class _NonalcoholicFattyliverScreenState
    extends State<NonalcoholicFattyliverScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NonalcoholicFattyliverController>();
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
                  "Non-Alcoholic Fatty Liver Disease",
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
                      "Metabolic Indicators",
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
                            value: "5.9% /102 ",
                            unit: "mg/dL",
                            status: "Moderate",
                            statusColor: AppColors.orange,
                            cardColor: AppColors.white,
                            isHigh: true,
                            graph: () => showDialoggraph(
                              context,
                              "HbA1c / Fasting Glucose",
                              "5.9% /102 mg/dL",
                              "Moderate",
                              "assets/images/moderate.png",
                              AppColors.orange,
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: AppColors.orange,
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
                                      sizedBoxWithWidth(5),
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: AppColors.red,
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
                                  sizedBoxWithHeight(5),
                                  Expanded(
                                    child: BarChart(
                                      BarChartData(
                                        alignment:
                                            BarChartAlignment.spaceAround,
                                        maxY: 8,
                                        barTouchData: BarTouchData(
                                          enabled: false,
                                        ),
                                        titlesData: FlTitlesData(
                                          leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                              showTitles: true,
                                              reservedSize: 28,
                                              interval: 2,
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
                                                const days = [
                                                  'M',
                                                  'T',
                                                  'W',
                                                  'T',
                                                  'F',
                                                  'S',
                                                  'S',
                                                ];
                                                return Text(
                                                  days[value.toInt()],
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        borderData: FlBorderData(show: false),
                                        gridData: FlGridData(show: true),
                                        barGroups: [
                                          BarChartGroupData(
                                            x: 0,
                                            barsSpace: 4,
                                            barRods: [
                                              BarChartRodData(
                                                toY: 8,
                                                color: AppColors.orange,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                              BarChartRodData(
                                                toY: 8,
                                                color: AppColors.red,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
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
                                                toY: 8,
                                                color: AppColors.orange,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                              BarChartRodData(
                                                toY: 8,
                                                color: AppColors.red,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
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
                                                toY: 8,
                                                color: AppColors.orange,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                              BarChartRodData(
                                                toY: 8,
                                                color: AppColors.red,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
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
                                                toY: 8,
                                                color: AppColors.orange,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                              BarChartRodData(
                                                toY: 8,
                                                color: AppColors.red,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
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
                                                toY: 8,
                                                color: AppColors.orange,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                              BarChartRodData(
                                                toY: 8,
                                                color: AppColors.red,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
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
                                                toY: 8,
                                                color: AppColors.orange,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                              BarChartRodData(
                                                toY: 8,
                                                color: AppColors.red,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
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
                                                toY: 8,
                                                color: AppColors.orange,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                              BarChartRodData(
                                                toY: 8,
                                                color: AppColors.red,
                                                width: 10,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        4,
                                                      ),
                                                      topRight: Radius.circular(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
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
                            title: "Insulin (Fasting) ",
                            value: "15",
                            unit: "µIU/mL",
                            status: "Moderate",
                            statusColor: AppColors.orange,
                            cardColor: AppColors.white,
                            isHigh: true,
                            graph: () => showDialoggraph(
                              context,
                              "Insulin (Fasting) ",
                              "15 µIU/mL",
                              "Moderate",
                              "assets/images/moderate.png",
                              AppColors.orange,
                              BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 30,
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
                                        interval: 6,
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
                                          toY: 14,
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
                                          toY: 14,
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
                                          toY: 14,
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
                                          toY: 14,
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
                                          toY: 14,
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
                                          toY: 14,
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
                                          toY: 14,
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
                      ],
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Triglycerides",
                      rating: "180 mg/dL",
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
                      "Liver Health Metrics",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "ALT (Alanine Aminotransferase)",
                      rating: "55 U/L",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "AST (Aspartate Aminotransferase)",
                      rating: "48 U/L",
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "GGT (Gamma-Glutamyl Transferase)",
                      rating: "70 U/L",
                      status: "Moderate",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "BMI / Body Fat %",
                      rating: "27.5 / 30%",
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
                      "Lifestyle",
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithoutpercentageCard(
                      title: "Weight Tracking",
                      rating: "80 kg",
                      status: "Moderate",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Diet (Fat, Sugar, Alcohol)",
                      value: "High Fat/Sugar, Moderate Alcohol",
                      percentage: 0.80,
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Physical Activity (Minutes/Week)",
                      value: "90 mins / 150 mins (Target)",
                      percentage: 0.80,
                      status: "Moderate",
                      statusColor: AppColors.orange,
                      statusimage: "assets/images/moderate.png",
                    ),
                    sizedBoxWithHeight(10),
                    GraphwithpercentageCard(
                      title: "Sleep Quality",
                      value: "6.0 hrs (Poor)",
                      percentage: 0.60,
                      status: "High",
                      statusColor: AppColors.red,
                      statusimage: "assets/images/high.png",
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
