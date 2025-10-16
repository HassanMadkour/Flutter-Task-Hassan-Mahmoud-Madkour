import 'package:flutter_task/features/bundles/domain/entities/feature_entity.dart';

class FeatureModel extends FeatureEntity {
  final int? id;

  FeatureModel({this.id, required super.name, super.note, required super.icon});

  // Convert a FeatureModel into a Map
  Map<String, dynamic> toDb() {
    return {'id': id, 'name': name, 'note': note, 'icon': icon};
  }

  // Create a FeatureModel from a Map
  factory FeatureModel.fromDb(Map<String, dynamic> map) {
    return FeatureModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      note: map['note'] as String?,
      icon: map['icon'] as int,
    );
  }

  // Convert a FeatureModel into a FeatureEntity
  FeatureEntity toEntity() {
    return FeatureEntity(name: name, note: note, icon: icon);
  }

  // Create a FeatureModel from a FeatureEntity
  factory FeatureModel.fromEntity(
    FeatureEntity entity, {
    int? id,
    int? bundleId,
  }) {
    return FeatureModel(
      id: id,
      name: entity.name,
      note: entity.note,
      icon: entity.icon,
    );
  }
}
