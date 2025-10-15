import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';

class ClassWidget extends StatelessWidget {
  const ClassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(right: 16),
      leading: Icon(Icons.real_estate_agent, color: AppColors.red),
      title: Text(
        "عقارات",
        style: AppFontStyle.tajawalMedium14.copyWith(color: Colors.black),
      ),
      subtitle: Text("فلل البيع", style: AppFontStyle.tajawalRegular12),
      trailing: Text("تغيير", style: AppFontStyle.tajawalBold14),
    );
  }
}
