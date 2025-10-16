import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/error/failures.dart';
import 'package:flutter_task/features/home/data/data_sources/category_local_data_source.dart';
import 'package:flutter_task/features/home/domain/entities/category_enitiy.dart';
import 'package:flutter_task/features/home/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource localDataSource;

  CategoryRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final categories = await localDataSource.getAllCategories();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure(message: 'Failed to load categories: $e'));
    }
  }
}
