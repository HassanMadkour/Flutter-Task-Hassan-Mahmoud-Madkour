import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';

class AppFonts {
  static const String tajawal = 'Tajawal';
}

class AppFontStyle {
  static TextStyle tajawalMedium16 = TextStyle(
    fontFamily: AppFonts.tajawal,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.black,
  );
  static TextStyle tajawalBold16 = TextStyle(
    fontFamily: AppFonts.tajawal,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.grayOpacity50,
  );
  // medium 14
  static TextStyle tajawalMedium14 = TextStyle(
    fontFamily: AppFonts.tajawal,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColors.grayOpacity50,
  );
  //regular 12
  static TextStyle tajawalRegular12 = TextStyle(
    fontFamily: AppFonts.tajawal,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.grayOpacity50,
  );
}
