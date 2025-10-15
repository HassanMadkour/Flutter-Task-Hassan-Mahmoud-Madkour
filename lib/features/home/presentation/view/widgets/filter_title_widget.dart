import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class FilterTitleWidget extends StatelessWidget {
  const FilterTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 12,
        children: [
          Icon(Icons.close, color: Colors.black, size: 9),
          Text("فلترة", style: AppFontStyle.tajawalMedium24),
          const Spacer(),
          Text(
            "رجوع للإفتراضي",
            style: AppFontStyle.tajawalBold16.copyWith(color: AppColors.blue),
          ),
        ],
      ),
    );
  }
}
