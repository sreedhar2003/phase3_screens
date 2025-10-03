import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class CircularpercentageCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final double percent; // between 0.0 - 1.0
  final Color color;
  final String statusIcon;
  final VoidCallback onGraphTap;

  const CircularpercentageCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.percent,
    required this.color,
    required this.statusIcon,
    required this.onGraphTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  maxLines: 2,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ),
              Image.asset(
                statusIcon,
                height: 16,
                width: 16,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const Spacer(),

          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // SizedBox(
                //   height: 80,
                //   width: 80,
                //   child: CircularProgressIndicator(
                //     value: percent,
                //     strokeWidth: 6,
                //     backgroundColor: Colors.grey.shade200,
                //     valueColor: AlwaysStoppedAnimation<Color>(color),
                //   ),
                // ),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CustomPaint(
                    painter: GradientCircularProgressPainter(
                      progress: percent,
                      colors: [
                        Colors.black,
                        color,
                      ], // gradient from black → your color
                      backgroundColor: Colors.grey.shade200,
                      strokeWidth: 6,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: GoogleFonts.roboto(
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        color: color,
                      ),
                    ),
                    Text(
                      unit,
                      style: GoogleFonts.roboto(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          sizedBoxWithHeight(20),

          // Gradient Button
          SizedBox(
            height: 44,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onGraphTap,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(75),
                ),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.gradientcolor1,
                      AppColors.gradientcolor2,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  final double progress; // 0.0 to 1.0
  final List<Color> colors;
  final Color backgroundColor;
  final double strokeWidth;

  GradientCircularProgressPainter({
    required this.progress,
    required this.colors,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2);

    /// Background circle
    final bgPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, bgPaint);

    /// Gradient shader
    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: -pi / 2 + 2 * pi * progress,
      colors: colors,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    /// Foreground arc
    canvas.drawArc(rect, -pi / 2, 2 * pi * progress, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
