import 'package:flutter_task/features/home/domain/entities/category_enitiy.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getAllCategories();
}
