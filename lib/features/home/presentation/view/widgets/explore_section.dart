import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_card.dart';

class ExploreSection extends StatelessWidget {
  const ExploreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text("استكشف العروض", style: AppFontStyle.tajawalMedium16),
            Spacer(),
            Text("الكل", style: AppFontStyle.tajawalBold16),
            Icon(Icons.arrow_back, color: AppColors.grayOpacity50),
          ],
        ),
        SizedBox(
          height: 41,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return ExploreCard();
            },
          ),
        ),
      ],
    );
  }
}
