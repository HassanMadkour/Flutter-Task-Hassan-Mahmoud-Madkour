import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/category_section.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [ExploreSection(), CategorySection(), OfferRow()],
          ),
        ),
      ),
    );
  }
}

class OfferRow extends StatelessWidget {
  const OfferRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Text("!لاي عرض تطلبه دلوقتي", style: AppFontStyle.tajawalRegular10),
      ],
    );
  }
}
