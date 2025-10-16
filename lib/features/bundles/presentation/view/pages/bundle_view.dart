import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';
import 'package:flutter_task/features/bundles/domain/entities/feature_entity.dart';
import 'package:flutter_task/features/bundles/presentation/view/widgets/bundle_card.dart';

class BundleView extends StatefulWidget {
  const BundleView({super.key});

  @override
  State<BundleView> createState() => BundleViewState();
}

class BundleViewState extends State<BundleView> {
  final List<BundleEntity> bundles = [
    BundleEntity(
      name: "أساسية",
      price: "3000",
      features: [
        FeatureEntity(
          name: "صلاحية الإعلان 30 يوم",
          note: null,
          icon: Icons.abc.codePoint,
        ),
      ],
      views: 7,
      highlight: "الأفضل قيمة مقابل سعر",
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                spacing: 12,
                children: [
                  Icon(Icons.arrow_back_ios_outlined, size: 12),
                  Text(
                    "أختر الباقات اللى تناسبك",
                    style: AppFontStyle.tajawalMedium24,
                  ),
                ],
              ),
              Text(
                "أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك",
                style: AppFontStyle.tajawalRegular14,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: bundles.length,
                  itemBuilder: (context, index) {
                    return BundleCard(bundleEntity: bundles[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
