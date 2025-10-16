import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      onTap: (value) {
        if (value.isEven) {
          GoRouter.of(context).push(AppRouter.bundleRoute);
        } else {
          GoRouter.of(context).push(AppRouter.filterRoute);
        }
      },
      unselectedItemColor: AppColors.blackOpacity50,
      unselectedLabelStyle: AppFontStyle.tajawalRegular12,
      selectedItemColor: AppColors.black,
      selectedLabelStyle: AppFontStyle.tajawalMedium12,
      showUnselectedLabels: true,
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(
          activeIcon: Container(
            padding: const EdgeInsets.only(top: 4, right: 6, left: 6),
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.black)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.bungalow_outlined),
                Text("الرئيسية", style: AppFontStyle.tajawalMedium12),
              ],
            ),
          ),
          icon: Icon(Icons.bungalow_outlined),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, size: 24),
          label: 'محادثة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined, size: 24),
          label: 'اضف اعلان',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dataset_outlined, size: 24),
          label: 'اعلاناتي',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined, size: 24),
          label: 'حسابي',
        ),
      ],
    );
  }
}
