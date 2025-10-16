import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/features_list_builder.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/view_section.dart';

class BundleCard extends StatelessWidget {
  const BundleCard({super.key, required this.isSelected, required this.plan});

  final bool isSelected;
  final Map<String, dynamic> plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.blackOpacity10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // السعر والعنوان
          Row(
            spacing: 12,
            children: [
              Icon(
                isSelected
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                color: isSelected ? AppColors.blue : AppColors.black,
              ),
              Text(
                plan['name'],
                style: AppFontStyle.tajawalBold16.copyWith(
                  color: isSelected ? AppColors.blue : AppColors.black,
                ),
              ),
              Spacer(),
              Text(
                "${plan['price']} ج.م",
                style: AppFontStyle.tajawalBold16.copyWith(
                  color: AppColors.red,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.red,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          Row(
            children: [
              Expanded(flex: 3, child: FeaturesListBuilder()),
              //views
              Expanded(flex: 1, child: ViewSection()),

              //Features
            ],
          ),
        ],
      ),
    );
  }
}
