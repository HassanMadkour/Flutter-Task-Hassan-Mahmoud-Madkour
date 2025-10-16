import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/home/domain/entities/category_enitiy.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Container(
          height: 56,
          width: 73,
          decoration: BoxDecoration(
            color: AppColors.blackOpacity10,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(child: Image.asset(category.image)),
        ),
        Text(category.name, style: AppFontStyle.tajawalRegular12),
      ],
    );
  }
}
