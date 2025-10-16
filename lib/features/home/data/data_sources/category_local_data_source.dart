import 'package:flutter_task/core/utils/db_service.dart';
import 'package:flutter_task/features/home/data/models/category_model.dart';
import 'package:flutter_task/features/home/domain/entities/category_enitiy.dart';

abstract class CategoryLocalDataSource {
  Future<List<CategoryEntity>> getAllCategories();
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  final DatabaseService databaseService;

  CategoryLocalDataSourceImpl({required this.databaseService});

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    var db = await databaseService.database;
    var result = await db.query('categories');
    return result.map((e) => CategoryModel.fromDb(e)).toList();
  }
}
