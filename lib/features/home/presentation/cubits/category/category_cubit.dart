import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/usecases/usecase.dart';
import 'package:flutter_task/features/home/domain/usecases/get_all_categories_use_case.dart';
import 'package:flutter_task/features/home/presentation/cubits/category/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  CategoryCubit({required this.getAllCategoriesUseCase})
    : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final result = await getAllCategoriesUseCase(NoParams());

    result.fold(
      (failure) => emit(CategoryError(failure.message)),
      (categories) => emit(CategoryLoaded(categories)),
    );
  }
}
