import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintText});
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: AppFontStyle.tajawalMedium14.copyWith(
          color: AppColors.blackOpacity50,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.blackOpacity10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.blackOpacity10),
        ),
        hintText: hintText,
      ),
    );
  }
}
