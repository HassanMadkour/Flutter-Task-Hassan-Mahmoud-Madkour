import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/usecases/usecase.dart';
import 'package:flutter_task/features/home/domain/usecases/get_all_products_use_case.dart';
import 'package:flutter_task/features/home/presentation/cubits/product/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProductsUseCase getAllProductsUseCase;

  ProductCubit({required this.getAllProductsUseCase}) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    final result = await getAllProductsUseCase(NoParams());

    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (products) => emit(ProductLoaded(products)),
    );
  }
}
