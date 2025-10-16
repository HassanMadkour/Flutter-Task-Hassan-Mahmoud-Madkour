import 'package:flutter_task/features/bundles/domain/entities/feature_entity.dart';

class BundleEntity {
  final String name;
  final String price;
  final List<FeatureEntity> features;
  final int? views;
  final String? highlight;
  bool isSelected;

  BundleEntity({
    required this.name,
    required this.price,
    required this.features,
    required this.views,
    this.highlight,
    this.isSelected = false,
  });
}
