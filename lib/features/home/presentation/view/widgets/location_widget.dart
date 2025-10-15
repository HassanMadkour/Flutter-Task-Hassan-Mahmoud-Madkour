import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 8,
        children: [
          Icon(Icons.location_on_outlined, color: AppColors.black, size: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "الموقع",
                style: AppFontStyle.tajawalMedium14.copyWith(
                  color: Colors.black,
                ),
              ),
              Text("مصر", style: AppFontStyle.tajawalRegular12),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColors.black,
            size: 12,
          ),
        ],
      ),
    );
  }
}
