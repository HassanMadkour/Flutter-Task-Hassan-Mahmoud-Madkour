import 'package:flutter_task/core/utils/db_service.dart';
import 'package:flutter_task/features/home/data/models/product_model.dart';
import 'package:flutter_task/features/home/domain/entities/product_entity.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductEntity>> getAllProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final DatabaseService databaseService;

  ProductLocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    var db = await databaseService.database;
    var result = await db.query('products');
    return result.map((e) => ProductModel.fromDb(e)).toList();
  }
}
