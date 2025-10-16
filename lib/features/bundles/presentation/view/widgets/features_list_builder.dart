import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/bundles/domain/entities/feature_entity.dart';

class FeaturesListBuilder extends StatelessWidget {
  const FeaturesListBuilder({super.key, required this.features});
  final List<FeatureEntity> features;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: features
          .map(
            (feature) => Row(
              spacing: 8,

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(feature.iconData, color: AppColors.black, size: 22),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feature.name,
                        style: AppFontStyle.tajawalMedium14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      if (feature.note != null)
                        Text(
                          "(${feature.note!})",
                          style: AppFontStyle.tajawalMedium14.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
