import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase3_screens/helpers/appcolors.dart';
import 'package:phase3_screens/helpers/size_extension.dart';

class CustomDropdownbuttons extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  final bool isOpen;
  final Function() onTap;
  final Function(String) onSelect;

  const CustomDropdownbuttons({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.isOpen,
    required this.onTap,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 20)],
          ),
          child: Column(
            children: [
              InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedValue,
                        style: GoogleFonts.roboto(
                          color: selectedValue == 'Select'
                              ? AppColors.grey
                              : AppColors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        isOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.black,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isOpen)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: options
                  .map(
                    (option) => InkWell(
                      onTap: () => onSelect(option),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: selectedValue == option
                              ? Colors.blue[50]
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          option,
                          style: GoogleFonts.roboto(
                            fontSize: 13.sp,
                            color: selectedValue == option
                                ? Colors.blue[900]
                                : Colors.black87,
                            fontWeight: selectedValue == option
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }
}
