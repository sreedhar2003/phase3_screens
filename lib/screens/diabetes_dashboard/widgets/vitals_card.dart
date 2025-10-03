import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/sizedbox.dart';

class VitalCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String status;
  final Color statusColor;
  final String iconPath;
  final VoidCallback onGraphTap;

  const VitalCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.status,
    required this.statusColor,
    required this.iconPath,
    required this.onGraphTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Image.asset(iconPath, height: 25, width: 25, fit: BoxFit.contain),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
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
                      status,
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

          // Bottom Row (title + value + button)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left side texts
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  sizedBoxWithHeight(5),
                  Text(
                    "$value $unit",
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Gradient Button
              SizedBox(
                width: 140,
                child: ElevatedButton(
                  onPressed: onGraphTap,
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
                        colors: [Color(0xFF00C853), Color(0xFF2E7D32)],
                      ),
                      borderRadius: BorderRadius.circular(25),
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
        ],
      ),
    );
  }
}
