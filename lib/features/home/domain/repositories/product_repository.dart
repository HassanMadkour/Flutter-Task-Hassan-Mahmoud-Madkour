import 'package:flutter_task/features/home/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getAllProducts();
}
