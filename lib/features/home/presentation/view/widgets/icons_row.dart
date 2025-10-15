import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CompanyBudget(),
        Spacer(),
        IconButton(
          onPressed: () {},
          iconSize: 16,
          icon: Icon(Icons.add_shopping_cart),
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(32, 24)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                side: BorderSide(color: AppColors.black2Opacity10),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        Image.asset("assets/icons/tal3t.png", height: 32, width: 15),
      ],
    );
  }
}

class CompanyBudget extends StatelessWidget {
  const CompanyBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton.filled(
          onPressed: () {},
          icon: Icon(Icons.corporate_fare_rounded),
          style: ButtonStyle(
            iconSize: WidgetStatePropertyAll(16),
            iconColor: WidgetStatePropertyAll(AppColors.blue),
            backgroundColor: WidgetStatePropertyAll(AppColors.blueOpacity10),
            minimumSize: WidgetStatePropertyAll(Size(32, 32)),
            maximumSize: WidgetStatePropertyAll(Size(32, 32)),
          ),
        ),
        Positioned(
          top: -2,
          right: -3,
          child: Icon(Icons.check_circle, color: AppColors.blue, size: 12),
        ),
      ],
    );
  }
}
