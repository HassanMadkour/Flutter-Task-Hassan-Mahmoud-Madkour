import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_fonts.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/products_sliver_grid.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/offer_row.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/category_section.dart';
import 'package:flutter_task/features/home/presentation/view/widgets/explore_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ExploreSection()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: CategorySection()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: OfferRow()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            ProductsSliverGrid(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          unselectedItemColor: AppColors.blackOpacity50,
          unselectedLabelStyle: AppFontStyle.tajawalRegular12,
          selectedItemColor: AppColors.black,
          selectedLabelStyle: AppFontStyle.tajawalMedium12,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.bungalow_outlined),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'محادثة'),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'اضف اعلان',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dataset_outlined),
              label: 'اعلاناتي',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}
