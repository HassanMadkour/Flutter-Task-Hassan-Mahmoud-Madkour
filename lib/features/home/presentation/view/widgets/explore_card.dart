import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackOpacity10),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: isSelected
            ? AppFontStyle.tajawalMedium14.copyWith(color: AppColors.red)
            : AppFontStyle.tajawalMedium14,
      ),
    );
  }
}
