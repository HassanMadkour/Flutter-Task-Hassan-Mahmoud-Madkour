import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class TitleWithChildWidget extends StatelessWidget {
  const TitleWithChildWidget({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            title,
            style: AppFontStyle.tajawalMedium16.copyWith(
              color: AppColors.grayOpacity50,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
