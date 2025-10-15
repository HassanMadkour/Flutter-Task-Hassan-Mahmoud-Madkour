import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class OfferRow extends StatelessWidget {
  const OfferRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.orangeOpacity5,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        spacing: 8,
        children: [
          Icon(Icons.check, color: AppColors.green, size: 16),
          Expanded(
            child: Text(
              "شحن مجاني",
              style: AppFontStyle.tajawalRegular12.copyWith(
                color: AppColors.green,
              ),
            ),
          ),
          Text("لأى عرض تطلبه دلوقتى !", style: AppFontStyle.tajawalRegular10),
        ],
      ),
    );
  }
}
