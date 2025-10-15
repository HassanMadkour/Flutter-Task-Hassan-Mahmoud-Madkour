import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/icons_row.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black2Opacity10),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/products/Picture.png"),
          Expanded(child: ProductInfoSection()),
        ],
      ),
    );
  }
}

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        spacing: 8,
        children: [
          ProductNameRow(),
          ProductPriceRow(),
          Row(
            children: [
              Icon(
                Icons.local_fire_department_outlined,
                color: AppColors.blackOpacity50,
                size: 12,
              ),
              Text("تم بيع 3.3k+", style: AppFontStyle.tajawalRegular10),
            ],
          ),
          Spacer(),
          IconsRow(),
        ],
      ),
    );
  }
}

class ProductNameRow extends StatelessWidget {
  const ProductNameRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            "جاكت من الصوف مناسب",
            style: AppFontStyle.tajawalMedium14.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        SvgPicture.asset(
          height: 16.5,
          width: 16.5,
          "assets/icons/precent.svg",
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}

class ProductPriceRow extends StatelessWidget {
  const ProductPriceRow({super.key});

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
                  text: "32,000,000جم/",
                  style: AppFontStyle.tajawalMedium14.copyWith(
                    color: AppColors.red,
                  ),
                ),
                TextSpan(
                  text: "60,000,000",
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
