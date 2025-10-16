import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class ViewSection extends StatelessWidget {
  const ViewSection({super.key, this.views});
  final int? views;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.greenOpacity5,
            border: Border(
              top: BorderSide(color: AppColors.green),
              left: BorderSide(color: AppColors.green),
              right: BorderSide(color: AppColors.green),
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Center(
            child: Text(
              views.toString(),
              style: AppFontStyle.tajawalBold14.copyWith(
                color: AppColors.green,
              ),
            ),
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          "ضعف عدد المشاهدات",
          style: AppFontStyle.tajawalRegular12.copyWith(
            color: AppColors.black,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ],
    );
  }
}
