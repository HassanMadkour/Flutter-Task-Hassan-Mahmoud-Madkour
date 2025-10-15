import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/product_item.dart';

class ProductsSliverGrid extends StatelessWidget {
  const ProductsSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 158 / 360,
        ),
        itemBuilder: (context, index) {
          return ProductItem();
        },
        itemCount: 10,
      ),
    );
  }
}
