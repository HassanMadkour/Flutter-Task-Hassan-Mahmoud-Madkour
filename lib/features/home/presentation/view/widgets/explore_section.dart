import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_offer_list_builder.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text("استكشف العروض", style: AppFontStyle.tajawalMedium16),
              Spacer(),
              Text("الكل", style: AppFontStyle.tajawalBold16),
              Icon(Icons.arrow_forward, color: AppColors.grayOpacity50),
            ],
          ),
        ),
        ExploreOfferListBuilder(),
      ],
    );
  }
}
