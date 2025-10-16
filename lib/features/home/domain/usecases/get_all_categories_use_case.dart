import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/error/failures.dart';
import 'package:flutter_task/core/usecases/usecase.dart';
import 'package:flutter_task/features/home/domain/entities/category_enitiy.dart';
import 'package:flutter_task/features/home/domain/repositories/category_repository.dart';

class GetAllCategoriesUseCase implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoryRepository repository;

  GetAllCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.getAllCategories();
  }
}
