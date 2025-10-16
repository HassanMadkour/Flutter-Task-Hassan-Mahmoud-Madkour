import 'package:flutter_task/core/utils/db_service.dart';
import 'package:flutter_task/features/home/domain/entities/product_entity.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductEntity>> getAllProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final DatabaseService databaseService;

  ProductLocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    return await databaseService.getAllProducts();
  }
}
