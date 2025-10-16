import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/presentation/cubits/product/product_cubit.dart';
import 'package:flutter_task/features/home/presentation/cubits/product/product_state.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/products_sliver_grid.dart';

class ProductsListBuilder extends StatelessWidget {
  const ProductsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return ProductsSliverGrid(products: state.products);
        } else if (state is ProductError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
