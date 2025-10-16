import 'package:flutter/material.dart';
import 'package:flutter_task/core/functions/number_with_comma.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/home/domain/entities/product_entity.dart';

class ProductPriceRow extends StatelessWidget {
  const ProductPriceRow({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${formatWithCommas(product.price)}جم/",
                  style: AppFontStyle.tajawalMedium14.copyWith(
                    color: AppColors.red,
                  ),
                ),
                TextSpan(
                  text: formatWithCommas(product.oldPrice),
                  style: AppFontStyle.tajawalRegular12.copyWith(
                    decoration: TextDecoration.lineThrough,

                    color: AppColors.grayOpacity50,
                  ),
                ),
              ],
            ),
          ),
        ),
        Icon(Icons.favorite_border, color: AppColors.black, size: 24),
      ],
    );
  }
}
