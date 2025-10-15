import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.blackOpacity10,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(child: Image.asset(name)),
        ),
        Text("الكترونيات", style: AppFontStyle.tajawalRegular12),
      ],
    );
  }
}
