import 'package:flutter_task/features/home/domain/entities/product_entity.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductEntity> products;

  const ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);
}
