import 'package:flutter_task/features/home/domain/entities/category_enitiy.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryEntity> categories;

  const CategoryLoaded(this.categories);
}

class CategoryError extends CategoryState {
  final String message;

  const CategoryError(this.message);
}
