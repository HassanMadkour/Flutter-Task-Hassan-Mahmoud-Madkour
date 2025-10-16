import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class UserCustomBundle extends StatelessWidget {
  const UserCustomBundle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.whiteOpacity,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.blackOpacity10),
      ),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "باقات مخصصة لك",
            style: AppFontStyle.tajawalMedium14.copyWith(
              color: AppColors.black,
            ),
          ),
          Text(
            "تواصل معنا لأختيار الباقة المناسبة لك",
            style: AppFontStyle.tajawalRegular12.copyWith(
              color: AppColors.black,
            ),
          ),
          Text(
            "فريق المبيعات",
            style: AppFontStyle.tajawalBold16.copyWith(color: AppColors.blue),
          ),
        ],
      ),
    );
  }
}
