import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class ProductNameRow extends StatelessWidget {
  const ProductNameRow({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            name,
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
