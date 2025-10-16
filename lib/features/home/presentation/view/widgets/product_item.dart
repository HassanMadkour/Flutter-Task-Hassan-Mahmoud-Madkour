import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/icons_row.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/product_name_row.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/product_price_row.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black2Opacity10),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Image.asset(product.image),
          Expanded(child: ProductInfoSection(product: product)),
        ],
      ),
    );
  }
}

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        spacing: 8,
        children: [
          ProductNameRow(name: product.name),
          ProductPriceRow(product: product),
          Row(
            children: [
              Icon(
                Icons.local_fire_department_outlined,
                color: AppColors.blackOpacity50,
                size: 12,
              ),
              Text(
                "تم بيع ${product.solidNumberInK}+",
                style: AppFontStyle.tajawalRegular10,
              ),
            ],
          ),
          Spacer(),
          IconsRow(),
        ],
      ),
    );
  }
}
