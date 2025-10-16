import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    super.key,
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 2,
          color: selected ? AppColors.blue : AppColors.blackOpacity10,
        ),
      ),
      child: Text(
        label,
        style: AppFontStyle.tajawalMedium14.copyWith(
          color: selected ? AppColors.blue : AppColors.blackOpacity50,
        ),
      ),
    );
  }
}
