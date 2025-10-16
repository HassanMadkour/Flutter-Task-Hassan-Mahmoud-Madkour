import 'package:flutter_task/features/bundles/data/models/feature_model.dart';
import 'package:flutter_task/features/bundles/domain/entities/bundle_entity.dart';

class BundleModel extends BundleEntity {
  final int? id;
  final List<FeatureModel> featureModels;

  BundleModel({
    this.id,
    required super.name,
    required super.price,
    required super.views,
    super.highlight,
    super.isSelected,
    required this.featureModels,
  }) : super(features: featureModels.map((f) => f.toEntity()).toList());

  // Convert a BundleModel into a Map
  Map<String, dynamic> toDb() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'views': views,
      'highlight': highlight,
      'isSelected': isSelected ? 1 : 0,
    };
  }

  // Create a BundleModel from a Map
  factory BundleModel.fromDb(
    Map<String, dynamic> map,
    List<FeatureModel> features,
  ) {
    return BundleModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      price: map['price'] as String,
      views: map['views'] as int,
      highlight: map['highlight'] as String?,
      isSelected: (map['isSelected'] as int) == 1,
      featureModels: features,
    );
  }

  BundleEntity toEntity() {
    return BundleEntity(
      name: name,
      price: price,
      features: features,
      views: views,
      highlight: highlight,
      isSelected: isSelected,
    );
  }

  // Create a BundleModel from a BundleEntity
  factory BundleModel.fromEntity(BundleEntity entity, {int? id}) {
    return BundleModel(
      id: id,
      name: entity.name,
      price: entity.price,
      views: entity.views,
      highlight: entity.highlight,
      isSelected: entity.isSelected,
      featureModels: entity.features
          .map((f) => FeatureModel.fromEntity(f))
          .toList(),
    );
  }
}
