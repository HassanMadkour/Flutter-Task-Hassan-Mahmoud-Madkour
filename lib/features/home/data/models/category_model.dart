import 'package:flutter_task/features/home/domain/entities/category_enitiy.dart';

class CategoryModel extends CategoryEntity {
  final int? id;

  CategoryModel({this.id, required super.name, required super.image});

  // Convert a CategoryModel into a Map
  Map<String, dynamic> toDb() {
    return {'id': id, 'name': name, 'image': image};
  }

  // Create a CategoryModel from a Map
  factory CategoryModel.fromDb(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  // Convert a CategoryModel into a CategoryEntity
  CategoryEntity toEntity() {
    return CategoryEntity(name: name, image: image);
  }

  // Create a CategoryModel from a CategoryEntity
  factory CategoryModel.fromEntity(CategoryEntity entity, {int? id}) {
    return CategoryModel(id: id, name: entity.name, image: entity.image);
  }
}
