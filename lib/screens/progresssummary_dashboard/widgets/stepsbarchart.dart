import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/screen_config.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/screens/progresssummary_dashboard/controller/progresssummary_controller.dart';
import 'package:provider/provider.dart';

class StepBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProgresssummaryController>();
    ScreenUtil.getInstance().init(context);
    return AspectRatio(
      aspectRatio: 1.2,
      child: BarChart(
        BarChartData(
          maxY: 10000,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              //tooltipBackgroundColor: Colors.green.shade100,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${provider.days1[groupIndex]}\nSteps: ${provider.steps[groupIndex]}',
                  GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2000,
                reservedSize: 40,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index >= 0 && index < provider.days1.length) {
                    return Text(provider.days1[index]);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(
            provider.steps.length,
            (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: provider.steps[index].toDouble(),
                  color: AppColors.green,
                  width: 20,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
