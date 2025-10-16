import 'package:flutter_task/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final int? id;
  final int? categoryId;

  ProductModel({
    this.id,
    this.categoryId,
    required super.name,
    required super.price,
    required super.oldPrice,
    required super.soldNumber,
    required super.image,
  });

  // Convert a ProductModel into a Map
  Map<String, dynamic> toDb() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'oldPrice': oldPrice,
      'soldNumber': soldNumber,
      'categoryId': categoryId,
      'image': image,
    };
  }

  // Create a ProductModel from a Map
  factory ProductModel.fromDb(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      price: (map['price'] as num).toDouble(),
      oldPrice: (map['oldPrice'] as num).toDouble(),
      soldNumber: map['soldNumber'] as int,
      categoryId: map['categoryId'] as int?,
      image: map['image'] as String,
    );
  }

  // Convert a ProductModel into a ProductEntity
  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      price: price,
      oldPrice: oldPrice,
      soldNumber: soldNumber,
      image: image,
    );
  }

  // Create a ProductModel from a ProductEntity
  factory ProductModel.fromEntity(
    ProductEntity entity, {
    int? id,
    int? categoryId,
  }) {
    return ProductModel(
      id: id,
      name: entity.name,
      price: entity.price,
      oldPrice: entity.oldPrice,
      soldNumber: entity.soldNumber,
      categoryId: categoryId,
      image: entity.image,
    );
  }
}
