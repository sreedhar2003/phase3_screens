import 'package:flutter/material.dart';
import 'package:phase3_screens/helpers/appcolors.dart';

class CustomTextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController textfieldcontroller;
  const CustomTextfield({
    super.key,
    required this.hinttext,
    required this.textfieldcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: textfieldcontroller,
        decoration: InputDecoration(
          hintText: hinttext,
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
