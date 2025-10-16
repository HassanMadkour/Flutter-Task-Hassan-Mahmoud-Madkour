import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/home/domain/entities/feature_entity.dart';

class FeaturesListBuilder extends StatelessWidget {
  const FeaturesListBuilder({super.key, required this.features});
  final List<FeatureEntity> features;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: features
          .map(
            (feature) => ListTile(
              title: Text(
                feature.name,
                style: AppFontStyle.tajawalMedium14.copyWith(
                  color: AppColors.black,
                ),
              ),
              leading: Icon(feature.iconData, color: AppColors.black),
              subtitle: feature.note == null
                  ? null
                  : Text(
                      "(${feature.note!})",
                      style: AppFontStyle.tajawalMedium14.copyWith(
                        color: AppColors.red,
                      ),
                    ),
            ),
          )
          .toList(),
    );
  }
}
