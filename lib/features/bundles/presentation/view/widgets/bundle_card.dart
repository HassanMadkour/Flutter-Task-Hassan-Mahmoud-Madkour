import 'package:flutter/material.dart';
import 'package:flutter_task/core/functions/number_with_comma.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/features_list_builder.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/rabbon_banner.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/view_section.dart';

class BundleCard extends StatelessWidget {
  const BundleCard({super.key, required this.bundleEntity});

  final BundleEntity bundleEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        MainInfo(bundleEntity: bundleEntity),
        Positioned(
          top: -18,
          right: 0,
          child: RibbonBanner(
            color: AppColors.pink,
            height: 31,
            child: bundleEntity.highlight != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 15.0),
                    child: Text(
                      bundleEntity.highlight!,
                      style: AppFontStyle.tajawalMedium12.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class MainInfo extends StatelessWidget {
  const MainInfo({super.key, required this.bundleEntity});

  final BundleEntity bundleEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.blackOpacity10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 12,
            children: [
              Icon(
                bundleEntity.isSelected
                    ? Icons.check_box_rounded
                    : Icons.check_box_outline_blank,
                color: bundleEntity.isSelected
                    ? AppColors.blue
                    : AppColors.black,
              ),
              Text(
                bundleEntity.name,
                style: AppFontStyle.tajawalBold16.copyWith(
                  color: bundleEntity.isSelected
                      ? AppColors.blue
                      : AppColors.black,
                ),
              ),
              Spacer(),
              Text(
                "${formatWithCommas(double.parse(bundleEntity.price))} ج.م",
                style: AppFontStyle.tajawalBold16.copyWith(
                  color: AppColors.red,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.red,
                  decorationStyle: TextDecorationStyle.solid,

                  decorationThickness: 1,
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          Row(
            spacing: 16,
            children: [
              Expanded(
                flex: 3,
                child: FeaturesListBuilder(features: bundleEntity.features),
              ),
              //views
              if (bundleEntity.views != null)
                Expanded(
                  flex: 1,
                  child: ViewSection(views: bundleEntity.views),
                ),

              //Features
            ],
          ),
        ],
      ),
    );
  }
}
